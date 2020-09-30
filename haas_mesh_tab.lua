module("luci.controller.myapp.haas_mesh_tab", package.seeall)
local http = require("luci.http")

function index()
entry({"admin", "haas_mesh_tab"}, firstchild(), "HaasMesh", 60).dependent=false  
entry({"admin", "haas_mesh_tab", "tab_from_view"}, template("myapp/monitor_tab"), "Monitor", 1)
--entry({"admin", "system", "tab_from_view"}, template("myapp/monitor_tab"), "Monitor", 8)
entry({"admin", "haas_mesh_tab", "webcmd"}, call("webcmd"))
end

function webcmd()
    local cmd = http.formvalue("cmd")
    if cmd then
	    local fp = io.popen(tostring(cmd).." 2>&1")
	    local result =  fp:read("*a")
	    fp:close()
        http.write(result)
    else
        http.write_json(http.formvalue())
    end
end

