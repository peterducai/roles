name=feature&color=#5DB65C&priority=5&descripton=new+functionality
name=bug&color=#FF0000&priority=5&descripton=new+bug
name=confirmed_bug&color=#D85450&priority=5&descripton=confirmed+bug
name=critical&color=#D85450&priority=5&descripton=critical+bug
name=discussion&color=#448AC9&priority=5&descripton=discussion
name=documentation&color=#EFAB4F&priority=5&descripton=docs
name=enhancement&color=#5DB65C&priority=5&descripton=enhancement+for+new+feature
name=suggestion&color=#448AC9&priority=5&descripton=suggestion
name=support&color=#FFA500&priority=5&descripton=support+questions


[{
    "name":"feature",
    "color":"#5DB65C",
    "priority":"5",
    "descripton":"new functionality"
},
{
    "name":"support",
    "color":"#FFA500",
    "priority":"5",
    "descripton":"supportquestions"
}]


[
    {
        "groups": [
            {
                "id": null,
                "name": "Testing",
                "path": "testing",
                "description": "investigation conducted to provide stakeholders with information about the quality of the software product or service under test",
                "subgroups": [
                    {
                        "parent_id": null,
                        "name": "Ansible1",
                        "path": "ansible1",
                        "description": "488-555-1212",
                    },
                    {
                        "parent_id": null,
                        "name": "Ansible2",
                        "path": "ansible2",
                        "description": "488-555-1212",
                    }
                ]
            },
            {
                "id": null,
                "name": "Testing2",
                "path": "testing2",
                "description": "investigation conducted to provide stakeholders with information about the quality of the software product or service under test",
                "subgroups": null
            },
            {
                "id": null,
                "name": "Testing3",
                "path": "testing3",
                "description": "in product or service under test",
                "subgroups": 
            }
        ]
    }
]




# PARENT GROUPS
curl -d "name=ansible&path=ansible&description=ansible+roles+for+DevOps&visibility=internal" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=toolbox&path=toolbox&description=any+profiles%2C+scripts+and+templates+to+be+shared+with+developers+and+sysadmins&visibility=internal" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=education&path=education&description=cheat-sheets%2C+wikis+and+educational+materials&visibility=internal" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups


# SUB-GROUPS security ---------------------------------------------------------------------------
OUT=$(curl -d "name=security&path=security&description=audit+tools+and+best+practices+for+security&visibility=internal" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups)
OUT2=$(echo $OUT | grep -o '^{"id":[[:digit:]]*') 
parentID=${OUT2:6}
sleep 2

# subcategories
curl -d "name=risk+assessment&path=risk-assessment&visibility=internal&description=creating+a+threat+model+and+defining+what+will+be+tested&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=security-auditing&path=security-auditing&visibility=internal&description=using+the+threat+model+to+probe+the+system+design&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=vulnerability+scanning&path=vulnerability-scanning&visibility=internal&description=using+software+to+probe+the+system+inplementation&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=penetration+testing&path=penetration-testin&visibility=internal&description=trying+to+hack+into+the+system%2C+either+externally+or+internally&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=operational+testing&path=operational-testing&visibility=internal&description=all+of+included+test+after+the+system+is+in+production&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups



# SUB-GROUPS testing ----------------------------------------------------------------------------
OUT=$(curl -d "name=testing&path=testing&description=investigation+conducted+to+provide+stakeholders+with+information+about+the+quality+of+the+software+product+or+service+under+test&visibility=internal" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups)
OUT2=$(echo $OUT | grep -o '^{"id":[[:digit:]]*') 
parentID=${OUT2:6}
sleep 2

# subcategories
#curl -d "name=sanity&path=sanity&description=surface+level+testing+where+QA+engineer+verifies+that+all+the+menus%2C+functions%2C+commands+available+in+the+product+and+project+are+working+fine&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=smoke+test&path=smoketest&description=before+any+other+test%2C+verify+that+the+application+launches+successfully+and+CLI+or+GUI+is+responsive&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=load+test&path=loadtest&description=conducted+to+understand+the+behavior+of+the+application+under+a+specific+expected+load&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=performance&path=perftest&description=to+determine+how+fast+some+aspect+of+a+system+performs+under+a+particular+workload&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=stress+test&path=stresstest&description=testing+beyond+normal+operational+capacity%2C+often+to+a+breaking+point%2C+in+order+to+observe+the+results&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups
curl -d "name=baseline+test&path=baselinetest&description=It+refers+to+the+validation+of+documents+and+specifications+on+which+test+cases+would+be+designed&visibility=internal&parent_id=${parentID}" --header "PRIVATE-TOKEN: ${CI_TOKEN}"  -X POST http://${ipaddr}:80/api/v4/groups

# API STRUCTURE
# type Groups struct {
# 	ID                   int           `json:"id"`
# 	WebURL               string        `json:"web_url"`
# 	Name                 string        `json:"name"`
# 	Path                 string        `json:"path"`
# 	Description          string        `json:"description"`
# 	Visibility           string        `json:"visibility"`
# 	LfsEnabled           bool          `json:"lfs_enabled"`
# 	AvatarURL            interface{}   `json:"avatar_url"`
# 	RequestAccessEnabled bool          `json:"request_access_enabled"`
# 	FullName             string        `json:"full_name"`
# 	FullPath             string        `json:"full_path"`
# 	ParentID             interface{}   `json:"parent_id"`
# 	Projects             []interface{} `json:"projects"`
# 	SharedProjects       []interface{} `json:"shared_projects"`
# }
