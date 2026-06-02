local LABEL_SET = {
  ["A."]=true, ["B."]=true, ["C."]=true, ["D."]=true, ["E."]=true,
  ["F."]=true, ["G."]=true, ["H."]=true,
  ["a)"]=true, ["b)"]=true, ["c)"]=true, ["d)"]=true, ["e)"]=true,
  ["f)"]=true, ["g)"]=true, ["h)"]=true,
}

local LABEL_COLOR = "2471A3"   -- bright blue for option labels
local QUESTION_COUNTER = 0

local function label_run(text, underline, color)
  local underline_xml = underline and '<w:u w:val="single"/>' or ''
  return pandoc.RawInline('openxml',
    '<w:r><w:rPr><w:b/>' .. underline_xml .. '<w:color w:val="' .. color .. '"/>'
    .. '<w:sz w:val="24"/><w:szCs w:val="24"/></w:rPr>'
    .. '<w:t xml:space="preserve">' .. text .. '</w:t></w:r>')
end

local function parse_label_prefix(text)
  local cleaned = text:gsub('^%s+', ''):gsub('^[%[%(%{]+', '')
  local upper = cleaned:match('^([A-H]%.)')
  if upper then
    return upper, cleaned:sub(#upper + 1)
  end

  local lower = cleaned:match('^([a-h]%))')
  if lower and LABEL_SET[lower] then
    return lower, cleaned:sub(#lower + 1)
  end

  return nil, cleaned
end

local function consume_option_marker(text, marker)
  local cleaned = text:gsub(marker .. '%s*', '')
  local label, rest = parse_label_prefix(cleaned)
  return label, rest
end

local function image_only_inlines(inlines)
  local extracted = pandoc.List()
  local has_image = false

  for _, inline in ipairs(inlines) do
    if inline.t == "Space" or inline.t == "SoftBreak" or inline.t == "LineBreak" then
      extracted:insert(inline)
    elseif inline.t == "Image" then
      extracted:insert(inline)
      has_image = true
    elseif inline.t == "Span" then
      local nested = image_only_inlines(inline.content)
      if nested == nil then
        return nil
      end
      for _, nested_inline in ipairs(nested) do
        if nested_inline.t == "Image" then
          has_image = true
        end
        extracted:insert(nested_inline)
      end
    else
      return nil
    end
  end

  if not has_image then
    return nil
  end

  return extracted
end

function Para(el)
  local has_cauhoi = false
  local has_tab = false
  local has_tab4 = false
  local has_anszyx = false
  local has_optszyx = false
  local set_question_number = nil

  pandoc.walk_block(el, {
    Str = function(s)
      if s.text:find("XYZCAUHOIZYX") then has_cauhoi = true end
      if s.text:find("XYZTABZYX") then has_tab = true end
      if s.text:find("XYZTAB4XYZ") then has_tab4 = true end
      if s.text:find("XYZANSWZYX") then has_anszyx = true end
      if s.text:find("XYZOPTSZYX") then has_optszyx = true end
      local n = s.text:match("XYZSETCAUZYX(%d+)")
      if n then set_question_number = tonumber(n) end
    end
  })

  if set_question_number ~= nil then
    QUESTION_COUNTER = set_question_number - 1
    return {}
  end

  local centered_image = image_only_inlines(el.content)
  if centered_image ~= nil then
    local new_el = pandoc.Para(centered_image)
    return pandoc.Div(new_el, pandoc.Attr("", {}, {{"custom-style", "CenteredImage"}}))
  end

  -- ─── Câu heading ───
  if has_cauhoi then
    QUESTION_COUNTER = QUESTION_COUNTER + 1
    local new_inlines = pandoc.List()
    local after_marker = false
    local question_label = "Câu " .. tostring(QUESTION_COUNTER) .. "."
    for _, inline in ipairs(el.content) do
      if inline.t == "Str" and inline.text:find("XYZCAUHOIZYX") then
        local cleaned = inline.text:gsub("XYZCAUHOIZYX%s*", "")
        after_marker = true
        if cleaned ~= "" then new_inlines:insert(pandoc.Str(cleaned)) end
      elseif after_marker and inline.t == "Space" then
        -- skip space between marker and label
      elseif after_marker and inline.t == "Strong" then
        -- Apply blue+bold only to the "*Câu X.*" label, not the whole paragraph
        new_inlines:insert(label_run(question_label, false, "1A5276"))
        new_inlines:insert(pandoc.RawInline('openxml',
          '<w:r><w:t xml:space="preserve"> </w:t></w:r>'))
        after_marker = false
      else
        after_marker = false
        new_inlines:insert(inline)
      end
    end
    local new_el = pandoc.Para(new_inlines)
    return pandoc.Div(new_el, pandoc.Attr("", {}, {{"custom-style", "CauHoi"}}))
  end

  -- ─── Options paragraph (2×2 or 1×4) ───
  if has_tab or has_tab4 then
    local marker = has_tab and "XYZTABZYX" or "XYZTAB4XYZ"
    local styleName = has_tab and "OptionsLayout" or "OptionsLayout1x4"
    local new_inlines = pandoc.List()
    local underlineNext = false

    for _, inline in ipairs(el.content) do
      if inline.t == "Str" then
        if inline.text:find("XYZANSWZYX") then
          local label, rest = consume_option_marker(inline.text, "XYZANSWZYX")
          if label then
            new_inlines:insert(label_run(label, true, LABEL_COLOR))
            if rest ~= "" then
              new_inlines:insert(pandoc.Str(rest))
            end
          else
            if rest ~= "" then
              new_inlines:insert(pandoc.Str(rest))
            end
            underlineNext = true
          end
        elseif inline.text:find(marker) then
          -- Split at tab markers, insert <w:tab/>
          local parts = {}
          local start = 1
          while true do
            local s, e = inline.text:find(marker, start)
            if not s then
              table.insert(parts, inline.text:sub(start))
              break
            end
            if s > start then
              table.insert(parts, inline.text:sub(start, s - 1))
            end
            table.insert(parts, marker)
            start = e + 1
          end

          for _, part in ipairs(parts) do
            if part == marker then
              new_inlines:insert(pandoc.RawInline('openxml', '<w:tab/>'))
            else
              if part ~= "" then
                new_inlines:insert(pandoc.Str(part))
              end
            end
          end
        elseif LABEL_SET[inline.text] then
          if underlineNext then
            new_inlines:insert(label_run(inline.text, true, LABEL_COLOR))
            underlineNext = false
          else
            new_inlines:insert(label_run(inline.text, false, LABEL_COLOR))
          end
        else
          underlineNext = false  -- reset: non-label after marker = no underline
          new_inlines:insert(inline)
        end
      else
        new_inlines:insert(inline)
      end
    end
    local new_el = pandoc.Para(new_inlines)
    return pandoc.Div(new_el, pandoc.Attr("", {}, {{"custom-style", styleName}}))
  end

  -- ─── Options paragraph (4×1: one option per line) ───
  -- Fires in all modes: each option line starts with XYZOPTSZYX or XYZANSWZYX.
  if (has_optszyx or has_anszyx) and not has_tab and not has_tab4 then
    local new_inlines = pandoc.List()
    local underlineNext = false

    for _, inline in ipairs(el.content) do
      if inline.t == "Str" then
        if inline.text:find("XYZOPTSZYX") then
          local label, rest = consume_option_marker(inline.text, "XYZOPTSZYX")
          if label then
            new_inlines:insert(label_run(label, false, LABEL_COLOR))
            if rest ~= "" then
              new_inlines:insert(pandoc.Str(rest))
            end
            underlineNext = false
          elseif rest ~= "" then
            new_inlines:insert(pandoc.Str(rest))
          end
        elseif inline.text:find("XYZANSWZYX") then
          local label, rest = consume_option_marker(inline.text, "XYZANSWZYX")
          if label then
            new_inlines:insert(label_run(label, true, LABEL_COLOR))
            if rest ~= "" then
              new_inlines:insert(pandoc.Str(rest))
            end
            underlineNext = false
          else
            if rest ~= "" then new_inlines:insert(pandoc.Str(rest)) end
            underlineNext = true
          end
        elseif LABEL_SET[inline.text] then
          if underlineNext then
            new_inlines:insert(label_run(inline.text, true, LABEL_COLOR))
            underlineNext = false
          else
            new_inlines:insert(label_run(inline.text, false, LABEL_COLOR))
          end
        else
          underlineNext = false
          new_inlines:insert(inline)
        end
      else
        new_inlines:insert(inline)
      end
    end
    local new_el = pandoc.Para(new_inlines)
    return pandoc.Div(new_el, pandoc.Attr("", {}, {{"custom-style", "OptionsLayout"}}))
  end
end
