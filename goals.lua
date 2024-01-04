---@diagnostic disable: undefined-global

function Goals(filename)
  local absolutePath = SKIN:MakePathAbsolute(filename)
  local goalsFile = io.open(absolutePath, "r")

  local errorMessageFile = "Error: Goals file not found!"
  if goalsFile == nil then
    SKIN:Bang("!Log", errorMessageFile, "Error")
    return errorMessageFile
  end

  local goalsReturn = "";

  for line in goalsFile:lines() do
    goalsReturn = goalsReturn .. line .. "\13\10"
  end

  goalsFile:close()

  local errorMessageReturn = "Error: Goals file is empty!"
  if goalsReturn == "" then
    SKIN:Bang("!Log", errorMessageReturn, "Error")
    return errorMessageReturn
  end

  return goalsReturn
end
