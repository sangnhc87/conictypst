function Para(el)
  local has_cauhoi = false
  pandoc.walk_block(el, {
    Str = function(s)
      if s.text:find("XYZCAUHOIZYX") then has_cauhoi = true end
    end
  })
  
  if has_cauhoi then
    -- Remove the XYZCAUHOIZYX string from the paragraph
    local new_para = pandoc.walk_block(el, {
      Str = function(s)
        if s.text:find("XYZCAUHOIZYX") then
          return pandoc.Str(s.text:gsub("XYZCAUHOIZYX%s*", ""))
        end
      end
    })
    return pandoc.Div(new_para, pandoc.Attr("", {}, {{"custom-style", "CauHoi"}}))
  end

  local has_tab = false
  pandoc.walk_block(el, {
    Str = function(s)
      if s.text:find("XYZTABZYX") then has_tab = true end
    end
  })
  
  if has_tab then
    return pandoc.Div(el, pandoc.Attr("", {}, {{"custom-style", "OptionsLayout"}}))
  end
end

function Inlines(inlines)
  local result = pandoc.List()
  for _, el in ipairs(inlines) do
    if el.t == "Str" and el.text:find("XYZTABZYX") then
      local parts = {}
      local start = 1
      while true do
        local s, e = el.text:find("XYZTABZYX", start)
        if not s then
          table.insert(parts, el.text:sub(start))
          break
        end
        if s > start then
          table.insert(parts, el.text:sub(start, s - 1))
        end
        table.insert(parts, "XYZTABZYX")
        start = e + 1
      end
      
      for _, part in ipairs(parts) do
        if part == "XYZTABZYX" then
          result:insert(pandoc.RawInline('openxml', '<w:tab/>'))
        else
          result:insert(pandoc.Str(part))
        end
      end
    else
      result:insert(el)
    end
  end
  return result
end
