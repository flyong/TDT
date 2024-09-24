//入口：工程
merge (node0:VirtualEntity{ ID:"VERE1", Entity:"Project",Name:"Laoying Tunnel", GeographicLocation:"云南省保山市隆阳区老营乡", ProjectSchedule:"68 month", Media:"photo:url1", Geometry:["Tunnel1","Tunnel2","Geology"],Tunnel:["SYSR->VERE2","SYSR->VERE3"],ProjectElement:["SYSR->S1","SYSR->S2"],Organization:["设计单位:云南省交通规划设计院","施工单位:云南省建设"],ConstructionState:"完成施工", Description:"分离式特长超深埋隧道，最大埋深1255.01m。一级公路。"});

//单位
merge (node0:VirtualEntity{ ID:"VERE15", Entity:"Organization",Name:"云南省交通规划设计院",OrganizationType:"Design", PEOP:["人员1","人员2"],Description:"云南省设计院"});
merge (node0:VirtualEntity{ ID:"VERE16", Entity:"Organization",OrganizationType:"Construction",Name:"施工单位", PEOP:["人员1","人员2"],Description:"施工单位"});
match (m), (n) where m.ID='VERE1' AND n.ID='VERE15' merge (m)-[r1:SystemRelation{ID:"SYSR1", Property:"has organization", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE1' AND n.ID='VERE16' merge (m)-[r1:SystemRelation{ID:"SYSR2", Property:"has organization", Category:"RefRelation"}]->(n);

//隧洞
merge (node1:VirtualEntity{ ID:"VERE2", Entity:"Tunnel",Name:"左洞",MilageRange:"ZK1+100-ZK3+000",Alignment:"SYSR1->alignment1",ProjectSchedule:"68 month",Geometry:["DesignStage:SYSR->GEOMX","ConstructionStage:SYSR->GEMOY"], Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：左洞"}); 
merge (node1:VirtualEntity{ ID:"VERE3", Entity:"Tunnel",Name:"右洞",MilageRange:"K1+100-K3+000",Alignment:"SYSR2->alignment2",ProjectSchedule:"68 month", media:"tunnel geometry1", Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：右洞"}); 

match (m), (n) where m.ID='VERE1' AND n.ID='VERE2' merge (m)-[r1:SystemRelation{ID:"SYSR1", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE1' AND n.ID='VERE3' merge (m)-[r1:SystemRelation{ID:"SYSR2", Property:"has subsystem", Category:"RefRelation"}]->(n);

//轴线
merge (node1:DiscreteAlignment{ID:"ALIM1", Entity:"Alignment2DVertical",Name:"alignment1",Geometry:"[1435,2172.972,-377.95,-7.45],[1440,2168.4156,-375.8857,-7.38],[1450,2159.2824,-371.8134,-7.32],[1460,2150.1172,-367.8136,-7.26],[1470,2140.9205,-363.8868,-7.19],[1480,2131.6929,-360.033,-7.14],[1490,2122.435,-356.2526,-7.08],[1500,2113.1475,-352.5458,-7.03],[1510,2103.8308,-348.9128,-6.97],[1520,2094.4856,-345.3538,-6.92],[1530,2085.1124,-341.8692,-6.87],[1540,2075.7118,-338.459,-6.83],[1550,2066.2845,-335.1235,-6.78],[1560,2056.8311,-331.8629,-6.74],[1570,2047.352,-328.6775,-6.7],[1580,2037.848,-325.5673,-6.66],[1590,2028.3196,-322.5327,-6.62],[1600,2018.7674,-319.5738,-6.59],[1610,2009.192,-316.6908,-6.56],[1620,1999.5941,-313.8839,-6.53],[1630,1989.9741,-311.1533,-6.5]",StartMilage:"ZK1+435",EndMilage:"ZK1+630",coordinate:"Local,offset=0,0,0",Description:"纵面线型"}); 

merge (node1:DiscreteAlignment{ ID:"ALIM2", Entity:"Alignment2DHorizontal",Name:"alignment2", alignment:"alignment2",  Geometry:"[1435,2172.972,-377.95,-7.45],[1440,2168.4156,-375.8857,-7.38],[1450,2159.2824,-371.8134,-7.32],[1460,2150.1172,-367.8136,-7.26],[1470,2140.9205,-363.8868,-7.19],[1480,2131.6929,-360.033,-7.14],[1490,2122.435,-356.2526,-7.08],[1500,2113.1475,-352.5458,-7.03],[1510,2103.8308,-348.9128,-6.97],[1520,2094.4856,-345.3538,-6.92],[1530,2085.1124,-341.8692,-6.87],[1540,2075.7118,-338.459,-6.83],[1550,2066.2845,-335.1235,-6.78],[1560,2056.8311,-331.8629,-6.74],[1570,2047.352,-328.6775,-6.7],[1580,2037.848,-325.5673,-6.66],[1590,2028.3196,-322.5327,-6.62],[1600,2018.7674,-319.5738,-6.59],[1610,2009.192,-316.6908,-6.56],[1620,1999.5941,-313.8839,-6.53],[1630,1989.9741,-311.1533,-6.5]",StartMilage:"ZK1+435",EndMilage:"ZK1+630",coordinate:"Local,offset=0,0,0",Description:"平面线型"}); 

match (m), (n) where m.ID='VERE2' AND n.ID='ALIM1' merge (m)-[r1:SystemRelation{ID:"SYSR3", Property:"has alignment", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE2' AND n.ID='ALIM2' merge (m)-[r1:SystemRelation{ID:"SYSR4", Property:"has alignment", Category:"RefRelation"}]->(n);

merge (node1:DiscreteAlignment{ID:"ALIM3", Entity:"Alignment3D",Name:"alignment3",Geometry:"empty",StartMilage:"K1+435",EndMilage:"K1+630",Description:"隧道轴线"});

match (m), (n) where m.ID='VERE3' AND n.ID='ALIM3' merge (m)-[r1:SystemRelation{ID:"SYSR5", Property:"has alignment", Category:"RefRelation"}]->(n);

//隧道分段
merge (node1:VirtualEntity{ ID:"VERE4", Entity:"TunnelElement",Name:"S1左幅",ProjectSchedule:"68 month",geometry:["Design:SYSRX->GEOMX","Construction:SYSR->GEOMY"],StartMilage:"K1+435",EndMilage:"K1+630",ConstructionProgress:["掌子面：K1+100","仰拱：K1+120","二衬：K1+300"],ConstructionState:"完成施工",Description:"左洞进口"}); 
merge (node1:VirtualEntity{ ID:"VERE5", Entity:"TunnelElement",Name:"S2右幅",Alignment:"SYSR6->alignment2",ProjectSchedule:"68 month", geometry:"tunnel geometry1", Property:"null",ConstructionState:"完成施工",Description:"保山至泸水：左洞出口"}); 
match (m), (n) where m.ID='VERE2' AND n.ID='VERE4' merge (m)-[r1:SystemRelation{ID:"SYSR13", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE3' AND n.ID='VERE5' merge (m)-[r1:SystemRelation{ID:"SYSR14", Property:"has subsystem", Category:"RefRelation"}]->(n);


//里程区间划分
merge (node1:VirtualEntity{ ID:"VERE14", Entity:"DesignPlan",Name:"设计方案", DesignPlanPhase:"施工图设计",Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"沿里程设计方案"});
match (m), (n) where m.ID='VERE1' AND n.ID='VERE14' merge (m)-[r1:SystemRelation{ID:"SYSR7", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE15' AND n.ID='VERE14' merge (m)-[r1:ActionRelation{ID:"SYSR7", Property:"designed", Category:"null"}]->(n);

merge (node1:AbstractEntity:Aggregation{ ID:"VERE6", Entity:"DesignMilageSegmentAggregation",Name:"左洞沿里程设计方案", Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"沿里程设计方案"});
merge (node1:AbstractEntity:Aggregation{ ID:"VERE7", Entity:"DesignMilageSegmentAggregation",Name:"右洞左洞沿里程设计方案", Data:["K2+300-K3+500:sf5a","K3+500-K4+600:sf5a"],Geometry:"three.js",Description:"沿里程设计方案"}); 

//设计方案关联至隧洞
match (m), (n) where m.ID='VERE2' AND n.ID='VERE6' merge (m)-[r1:SystemRelation{ID:"SYSR7", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE3' AND n.ID='VERE7' merge (m)-[r1:SystemRelation{ID:"SYSR8", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE6' AND n.ID='VERE14' merge (m)-[r1:SystemRelation{ID:"SYSR7", Property:"refer to", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE7' AND n.ID='VERE14' merge (m)-[r1:SystemRelation{ID:"SYSR8", Property:"refer to", Category:"RefRelation"}]->(n);

//设计里程分段关联至设计方案
merge (node1:VirtualEntity{ ID:"VERE8", Entity:"DesignMilageSegment",Name:"ZK1+100-ZK2+200",DesignGrade:"sf5a",Description:"设计方案里程分段"});
merge (node1:VirtualEntity{ ID:"VERE13", Entity:"DesignMilageSegment",Name:"ZK2+200-ZK2+250",DesignGrade:"s4jt",Description:"设计方案里程分段"});
merge (node1:VirtualEntity{ ID:"VERE9", Entity:"DesignMilageSegment",Name:"ZK2+250-ZK3+000",DesignGrade:"sf4a",Description:"设计方案里程分段"});
match (m), (n) where m.ID='VERE6' AND n.ID='VERE8' merge (m)-[r1:SystemRelation{ID:"SYSR9", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE6' AND n.ID='VERE9' merge (m)-[r1:SystemRelation{ID:"SYSR10", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE6' AND n.ID='VERE13' merge (m)-[r1:SystemRelation{ID:"SYSR10", Property:"has subsystem", Category:"RefRelation"}]->(n);

//设计衬砌等级关联至设计方案
merge (node1:VirtualEntity{ ID:"VERE10", Entity:"DesignLiningGrade",Name:"sf5a",Description:"五级衬砌"});
merge (node1:VirtualEntity{ ID:"VERE11", Entity:"DesignLiningGrade",Name:"sf4a",Description:"四级衬砌"});
merge (node1:VirtualEntity{ ID:"VERE12", Entity:"DesignLiningGrade",Name:"s4jt",Description:"四级停车带"});
match (m), (n) where m.ID='VERE14' AND n.ID='VERE10' merge (m)-[r1:SystemRelation{ID:"SYSR9", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE14' AND n.ID='VERE11' merge (m)-[r1:SystemRelation{ID:"SYSR10", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE14' AND n.ID='VERE12' merge (m)-[r1:SystemRelation{ID:"SYSR12", Property:"has subsystem", Category:"RefRelation"}]->(n);

//设计衬砌等级关联至设计分段
match (m), (n) where m.ID='VERE8' AND n.ID='VERE10' merge (m)-[r1:SystemRelation{ID:"SYSR13", Property:"refer to", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE9' AND n.ID='VERE11' merge (m)-[r1:SystemRelation{ID:"SYSR14", Property:"refer to", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE13' AND n.ID='VERE12' merge (m)-[r1:SystemRelation{ID:"SYSR14", Property:"refer to", Category:"RefRelation"}]->(n);

//设计参数
merge (node1:Structure:Design{ID:"STRU1", Entity:"Shotcrete",Name:"初喷混凝土",Geometry:"SECT->GEOM1",DesignLiningGrade:"sf4a",StasticProperty:["SHOC_THIC:40","SHOC_RTHI:60"],Resources:["MaterialType:Concrete","Grade:C25"],Description:"sf4a衬喷"});
match (m), (n) where m.ID='VERE10' AND n.ID='STRU1' merge (m)-[r1:SystemRelation{ID:"SYSR6",Property:"has subsystem", Category:"RefRelation"}]->(n);

//初喷截面
merge (node1:Geometry{ ID:"GEOM1", Entity:"ParametricGeometry:",Name:"Section",GeometryType:"2DSection", Geometry:["Outer:[-0.964558,-4.029379;-1.92654,-3.954647;-2.883377,-3.830315;-3.832513,-3.656716;-5.659633,-3.434313;-4.771412,-3.434313;-5.814615,-2.93178;-5.942047,-2.421566;-6.041555,-1.905178;-6.112842,-1.384144;-6.155699,-0.860006;-6.03517,0.948502;-5.636574,2.175252;-4.991634,3.292322;-4.128535,4.250891;-3.084999,5.009064;-1.906634,5.533706;-0.64494,5.801887;0.644941,5.801887;1.906636,5.533706;3.085001,5.009064;4.128537,4.250891;4.991636,3.292322;5.636576,2.175253;6.035172,0.948503;6.155701,-0.860006;6.112844,-1.384144;6.041557,-1.905178;5.942049,-2.421566;5.814617,-2.93178;4.771414,-3.434313;5.659635,-3.434313;3.832515,-3.656716;2.883379,-3.830315;1.926542,-3.954647;0.96456,-4.029379;0.000001,-4.054312;]","Inner:[-1.13188,-3.79956;-2.259496,-3.695434;-3.378601,-3.522326;-4.746664,-3.191415;-4.989731,-3.05949;-5.207349,-2.88882;-5.393405,-2.6842;-5.54267,-2.451379;-5.900198,-1.102526;-5.939489,0.019182;-5.767427,1.128311;-5.390136,2.185394;-4.82104,3.152815;-4.080391,3.996149;-3.194545,4.685386;-2.195022,5.196001;-1.117391,5.509824;0.000001,5.615687;1.117393,5.509824;2.195024,5.196001;3.194547,4.685386;4.080393,3.996149;4.821042,3.152815;5.390138,2.185394;5.767429,1.128311;5.939491,0.019182;5.9002,-1.102526;5.542672,-2.451379;5.393407,-2.6842;5.207351,-2.88882;4.989733,-3.05949;4.746666,-3.191415;3.378603,-3.522326;2.259498,-3.695434;1.131881,-3.79956;0.000001,-3.834312;]"],Description:"设计模型"}); 
match (m), (n) where m.ID='STRU1' AND n.ID='GEOM1' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has geometry", Category:"RefRelation"}]->(n);

//锚杆
merge (node1:Structure:Design{ID:"STRU2", Entity:"BOLT",Name:"锚杆",Geometry:"SECT->GEOM2",DesignLiningGrade:"sf4a",StasticProperty:["BOLT_LENT:2500","BOLT_RADI:40","HOPE_DIST:1200","LONG_DIST:1200"],Resources:["MaterialType:Rebar","Grade:HRB235"],Description:"sf4a锚杆"});
match (m), (n) where m.ID='VERE10' AND n.ID='STRU2' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has subsystem", Category:"RefRelation"}]->(n);

//隧洞设计几何模型：
merge (node1:Aggregation:Geometry{ID:"GEOM3", Entity:"ComplexGeometryAggregation",Name:"左洞设计几何模型",MilageRange:"ZK1+100-ZK3+300",Geometry:["SYSR->GEMO5","SYSR->GEMO6"],Description:"左洞设计几何模型"});
match (m), (n) where m.ID='VERE2' AND n.ID='GEOM3' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has geometry", Category:"RefRelation"}]->(n);

//设计分段几何
merge (node1:Aggregation:Geometry{ID:"GEMO4", Entity:"ComplexGeometryAggregation",Name:"几何ZK1+100-ZK2+200",MilageRange:"ZK1+100-ZK2+200",Geometry:["SYSR->GEMO7","SYSR->GEMO8"],Description:"ZK1+100-ZK2+200几何模型"});
merge (node1:Aggregation:Geometry{ID:"GEMO5", Entity:"ComplexGeometryAggregation",Name:"几何ZK2+200-ZK2+250",MilageRange:"ZK2+200-ZK2+250",Geometry:["SYSR->GEMO9","SYSR->GEMO10"],Description:"ZKZK2+200-ZK2+250几何模型"});
//分段与几何关联
match (m), (n) where m.ID='VERE8' AND n.ID='GEMO4' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has geometry", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='VERE9' AND n.ID='GEMO5' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has geometry", Category:"RefRelation"}]->(n);
//分段几何聚类成隧道几何
match (m), (n) where m.ID='GEOM3' AND n.ID='GEMO4' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has subsystem", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='GEOM3' AND n.ID='GEMO5' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"has subsystem", Category:"RefRelation"}]->(n);

//初喷几何
merge (node1:Geometry{ ID:"GEOM11", Entity:"ParametricGeometry:",Name:"初喷几何ZK1+100-ZK2+200",GeometryType:"SweptSolid", Geometry:["Profile:SYST->GEOM1","Alignment:SYST->ALIM1"],Description:"设计模型"});
//关联至截面以及轴线以完成几何模型的拉伸
match (m), (n) where m.ID='GEOM11' AND n.ID='GEOM1' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"refer to", Category:"RefRelation"}]->(n);
match (m), (n) where m.ID='GEOM11' AND n.ID='ALIM1' merge (m)-[r1:SystemRelation{ID:"SYSR6", Property:"refer to", Category:"RefRelation"}]->(n);


merge (node1:Structure:Construction{ID:"SHOTCRETE", 实体:"SHOTCRETE",名称:"喷射混凝土",Geometry:"点云模型",位置:"K6+994.1-K6+995.3",施工时间:"UTC+8 2021/12/10 18:30:00",Property:["衬砌等级:V级"],材料:["材料类型:喷射混凝土","材料等级:C25"],状态:"稳定",描述:"null"});