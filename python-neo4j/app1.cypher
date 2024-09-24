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