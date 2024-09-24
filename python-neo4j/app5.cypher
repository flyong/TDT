//地质体数字孪生
merge (node0:VirtualEntity{ GUID:"VERE1", Entity:"Project",Name:"Laoying Tunnel", GeographicLocation:"云南省保山市隆阳区老营乡", ProjectSchedule:"68 month", Media:"photo:url1", Geometry:["Tunnel1","Tunnel2","Geology"],Tunnel:["SYSR->VERE2","SYSR->VERE3"],ProjectElement:["SYSR->S1","SYSR->S2"],Organization:["设计单位:云南省交通规划设计院","施工单位:云南省建设"],ConstructionState:"完成施工", Description:"分离式特长超深埋隧道，最大埋深1255.01m。一级公路。"});

//
merge (node0:VirtualEntity{ GUID:"VERE15", Entity:"Organization",Name:"云南省交通规划设计院",OrganizationType:"Design", PEOP:["人员1","人员2"],Description:"云南省设计院"});
merge (node0:VirtualEntity{ GUID:"VERE16", Entity:"Organization",OrganizationType:"Construction",Name:"施工单位", PEOP:["人员1","人员2"],Description:"施工单位"});
match (m), (n) where m.GUID='VERE1' AND n.GUID='VERE15' merge (m)-[r1:SystemRelation{ID:"SYSR1", Property:"has organization", Category:"RefRelation"}]->(n);
match (m), (n) where m.GUID='VERE1' AND n.GUID='VERE16' merge (m)-[r1:SystemRelation{ID:"SYSR2", Property:"has organization", Category:"RefRelation"}]->(n);

//隧洞
merge (node1:VirtualEntity{ GUID:"VERE2", Entity:"Tunnel",Name:"左洞",MilageRange:"ZK1+100-ZK3+000",Alignment:"SYSR1->alignment1",ProjectSchedule:"68 month",Geometry:["DesignStage:SYSR->GEOMX","ConstructionStage:SYSR->GEMOY"], Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：左洞"}); 
merge (node1:VirtualEntity{ GUID:"VERE3", Entity:"Tunnel",Name:"右洞",MilageRange:"K1+100-K3+000",Alignment:"SYSR2->alignment2",ProjectSchedule:"68 month", media:"tunnel geometry1", Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：右洞"}); 

match (m), (n) where m.GUID='VERE1' AND n.GUID='VERE2' merge (m)-[r1:SystemRelation{ID:"SYSR1", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.GUID='VERE1' AND n.GUID='VERE3' merge (m)-[r1:SystemRelation{ID:"SYSR2", Property:"has subsystem", Category:"RefRelation"}]->(n);

//轴线
merge (node1:DiscreteAlignment{GUID:"ALIM1", Entity:"Alignment2DVertical",Name:"alignment1",Geometry:"[1435,2172.972,-377.95,-7.45],[1440,2168.4156,-375.8857,-7.38],[1450,2159.2824,-371.8134,-7.32],[1460,2150.1172,-367.8136,-7.26],[1470,2140.9205,-363.8868,-7.19],[1480,2131.6929,-360.033,-7.14],[1490,2122.435,-356.2526,-7.08],[1500,2113.1475,-352.5458,-7.03],[1510,2103.8308,-348.9128,-6.97],[1520,2094.4856,-345.3538,-6.92],[1530,2085.1124,-341.8692,-6.87],[1540,2075.7118,-338.459,-6.83],[1550,2066.2845,-335.1235,-6.78],[1560,2056.8311,-331.8629,-6.74],[1570,2047.352,-328.6775,-6.7],[1580,2037.848,-325.5673,-6.66],[1590,2028.3196,-322.5327,-6.62],[1600,2018.7674,-319.5738,-6.59],[1610,2009.192,-316.6908,-6.56],[1620,1999.5941,-313.8839,-6.53],[1630,1989.9741,-311.1533,-6.5]",StartMilage:"ZK1+435",EndMilage:"ZK1+630",coordinate:"Local,offset=0,0,0",Description:"纵面线型"}); 

merge (node1:DiscreteAlignment{ GUID:"ALIM2", Entity:"Alignment2DHorizontal",Name:"alignment2", alignment:"alignment2",  Geometry:"[1435,2172.972,-377.95,-7.45],[1440,2168.4156,-375.8857,-7.38],[1450,2159.2824,-371.8134,-7.32],[1460,2150.1172,-367.8136,-7.26],[1470,2140.9205,-363.8868,-7.19],[1480,2131.6929,-360.033,-7.14],[1490,2122.435,-356.2526,-7.08],[1500,2113.1475,-352.5458,-7.03],[1510,2103.8308,-348.9128,-6.97],[1520,2094.4856,-345.3538,-6.92],[1530,2085.1124,-341.8692,-6.87],[1540,2075.7118,-338.459,-6.83],[1550,2066.2845,-335.1235,-6.78],[1560,2056.8311,-331.8629,-6.74],[1570,2047.352,-328.6775,-6.7],[1580,2037.848,-325.5673,-6.66],[1590,2028.3196,-322.5327,-6.62],[1600,2018.7674,-319.5738,-6.59],[1610,2009.192,-316.6908,-6.56],[1620,1999.5941,-313.8839,-6.53],[1630,1989.9741,-311.1533,-6.5]",StartMilage:"ZK1+435",EndMilage:"ZK1+630",coordinate:"Local,offset=0,0,0",Description:"平面线型"}); 

match (m), (n) where m.GUID='VERE2' AND n.GUID='ALIM1' merge (m)-[r1:SystemRelation{ID:"SYSR3", Property:"has alignment", Category:"RefRelation"}]->(n);
match (m), (n) where m.GUID='VERE2' AND n.GUID='ALIM2' merge (m)-[r1:SystemRelation{ID:"SYSR4", Property:"has alignment", Category:"RefRelation"}]->(n);

merge (node1:DiscreteAlignment{GUID:"ALIM3", Entity:"Alignment3D",Name:"alignment3",Geometry:"empty",StartMilage:"K1+435",EndMilage:"K1+630",Description:"隧道轴线"});

match (m), (n) where m.GUID='VERE3' AND n.GUID='ALIM3' merge (m)-[r1:SystemRelation{ID:"SYSR5", Property:"has alignment", Category:"RefRelation"}]->(n);

//隧道分段
merge (node1:VirtualEntity{ GUID:"VERE4", Entity:"TunnelElement",Name:"S1左幅",ProjectSchedule:"68 month",geometry:["Design:SYSRX->GEOMX","Construction:SYSR->GEOMY"],StartMilage:"K1+435",EndMilage:"K1+630",ConstructionProgress:["掌子面：K1+100","仰拱：K1+120","二衬：K1+300"],ConstructionState:"完成施工",Description:"左洞进口"}); 
merge (node1:VirtualEntity{ GUID:"VERE5", Entity:"TunnelElement",Name:"S2右幅",Alignment:"SYSR6->alignment2",ProjectSchedule:"68 month", geometry:"tunnel geometry1", Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：左洞出口"}); 
match (m), (n) where m.GUID='VERE2' AND n.GUID='VERE4' merge (m)-[r1:SystemRelation{ID:"SYSR13", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.GUID='VERE3' AND n.GUID='VERE5' merge (m)-[r1:SystemRelation{ID:"SYSR14", Property:"has subsystem", Category:"RefRelation"}]->(n);