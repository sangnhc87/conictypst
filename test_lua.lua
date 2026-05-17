function Str(el)
  if el.text == "TAB" then
    return pandoc.RawInline('openxml', '<w:tab/>')
  end
end
