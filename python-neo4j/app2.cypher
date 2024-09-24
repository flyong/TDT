//app1：施工工法及步骤,施工过程以及工法不能够直接按照里程进行索引的，空间是辅助索引，而时间或者施工循环才是最主要的索引
//需要厘清若干概念：工法、施工进度、里程划分
merge (node1:Construction:Aggregation{ ID:"AGGR1", Entity:"ConstructionAggregationByTime",Name:"时间索引施工过程", Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"沿里程设计方案"});

//不同的section进行整合
merge (node62:Pre_support:Structure:Section{ ID:"e123", entity:"Presupport section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node63:Primary_support:Structure:Section{ ID:"e125", entity:"Prisupport section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node64:Waterproof_drainage:Section{ ID:"e127", entity:"Waterproof drainage section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node65:Temporary_support:Structure:Section{ ID:"e129", entity:"Temporty support section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node66:Section:Structure:Secondary_lining{ ID:"e131", entity:"Secondary lining section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node67:Section:Tunnel{ ID:"e133", entity:"Tunnel strucuture section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node68:Section:Geology{ ID:"e135", entity:"Geological section", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 


//模型
merge (node1:Construction:Aggregation{ ID:"AGGR2", Entity:"ConstructionAggregationByTime",Name:"时间索引施工过程", Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"施工进度"});

merge (node1:Construction:Aggregation{ ID:"AGGR2", Entity:"ConstructionAggregationByTime",Name:"空间分段索引的施工过程", Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"按照物理对象以及空间进行划分的模型"});

merge (node1:Construction:Aggregation{ ID:"AGGR2", Entity:"ConstructionProgressAggregation",Name:"施工进度", Data:["超前","初支","二衬","仰拱"],Geometry:"three.js",Description:"按天汇报施工进度"});



merge (e01:Structure:Construction {ID: "STRU1", Entity: "Spiling bolts",Name:"超前锚杆",MilageRange:"ZK1+100-ZK1+120",TimeRange:"2023-01-01 08:00-2023-01-01 12:00",Geometry:"null",ConstructionState:"Finished",StasticProperty:["BoltType:注浆","BOLT_RIDA:30"],DynamicProperty:"null",PhysicalModel:["StrengthLine:SYSR->PHYM1","BoltingStrength:150Mpa"],Material:"Rebar:HRB235",Description:"null"});

merge (e1:Structure:Construction{ ID: "4", Entity: "Shotcrete", Name:"初喷混凝土", MilageRange:"ZK1+100-ZK1+120",TimeRange:"2023-01-01 08:00-2023-01-01 12:00",Geometry:"SECT->GEOM1",ConstructionState:"Finished",
StasticProperty:["SHOC_THIC:40","SHOC_RTHI:60"],DynamicProperty:"Convergence->SENS1",Geometry:["Scanned:POTC1","Deformation:Parametric1"],Resources:["MaterialType:Concrete","Grade:C25"],PhysicalModel:["StrengthLine:SYSR->PHYM1","BoltingStrength:150Mpa"],Description:"null"});

merge (e01:Structure:Construction {ID: "STRU1", Entity: "Spiling bolts",Name:"锚杆",MilageRange:"ZK1+100-ZK1+120",TimeRange:"2023-01-01 08:00-2023-01-01 12:00",ConstructionState:"Finished",StasticProperty:["BoltType:注浆","BOLT_RIDA:30"],DynamicProperty:"null",PhysicalModel:["StrengthLine:SYSR->PHYM1","BoltingStrength:150Mpa"],Material:"Rebar:HRB235",Description:"sf4a锚杆"});

//细粒度：按照场景划分细粒度，

//需要关联至：截面，设计方案，几何模型（扫描的、参数化的、监控可视化的），施工进度，传感器, 时间关联的施工部，空间关联的实体


//如何仅台阶法施工进度进行表达：每时每刻都要记录？

merge (e02:Structure:Construction { ID: "2", Entity: "Pre_vaults", Name:"小导管",Description:"null", Position:"K1+100", state:"0",geometry:"null",property:"null",behaviormodel:"null",time:"0:00"});
merge (e03:Pre_support:Structure { ID: "3", Entity: "Umbrella vault", Name:"管棚",Description:"null", Position:"K1+100", state:"0",geometry:"null",property:"null",behaviormodel:"null",time:"0:00"});

merge (node1:Pre_support:Structure{ ID:"e1", entity:"Spiling bolts", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node2:Pre_support:Structure{ ID:"e3", entity:"Prevaults", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node3:Pre_support:Structure{ ID:"e5", entity:"Umbrella vault", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node4:Primary_support:Structure{ ID:"e7", entity:"Shotcrete", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node5:Primary_support:Structure{ ID:"e9", entity:"Wire mesh", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node6:Primary_support:Structure{ ID:"e11", entity:"Bolt", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node7:Primary_support:Structure{ ID:"e13", entity:"Foot reinforcement bolting", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node8:Primary_support:Structure{ ID:"e15", entity:"Steel arch", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node9:Primary_support:Structure{ ID:"e17", entity:"Grid arch", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node10:Waterproof_drainage{ ID:"e19", entity:"Waterproof cloth", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node11:Waterproof_drainage{ ID:"e21", entity:"Waterproof panel", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node12:Waterproof_drainage{ ID:"e23", entity:"Drainage pipe", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node13:Secondary_lining:Structure{ ID:"e25", entity:"Secondary cast in situ concrete", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node14:Secondary_lining:Structure{ ID:"e27", entity:"Secondary rebar", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node15:Invert_arch:Structure{ ID:"e29", entity:"Invert arch support", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node16:Invert_arch:Structure{ ID:"e31", entity:"Invert arch concrete", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node17:Temporary_support:Structure{ ID:"e33", entity:"Temporary invert arch", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node18:Temporary_support:Structure{ ID:"e35", entity:"Temporary arch", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node19:Temporary_support:Structure{ ID:"e37", entity:"Temporary concrete", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node20:Temporary_support:Structure{ ID:"e39", entity:"Injection", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node21:Geology{ ID:"e41", entity:"Strata", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node22:Geology{ ID:"e43", entity:"Surrounding rock", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node23:Geology{ ID:"e45", entity:"Tunnel face", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node24:Geology{ ID:"e47", entity:"Joint", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node25:Geology{ ID:"e49", entity:"Sequencing rock", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node26:Geology{ ID:"e51", entity:"Advanced hole", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node27:Geology{ ID:"e53", entity:"Advanced geosurvey", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node28:Geology{ ID:"e55", entity:"Leak", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node29:Machinery{ ID:"e57", entity:"Excavator", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node30:Machinery{ ID:"e59", entity:"Dumper", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node31:Machinery{ ID:"e61", entity:"Secondary lining machine", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node32:Machinery{ ID:"e63", entity:"Drill machine", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node33:Machinery{ ID:"e65", entity:"Light", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node34:Machinery{ ID:"e67", entity:"Ventilate pipe", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node35:Machinery{ ID:"e69", entity:"Ventilator", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node36:Machinery{ ID:"e71", entity:"Invert arch machine", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node37:Machinery{ ID:"e73", entity:"Concrete mixer truck", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node38:People{ ID:"e75", entity:"Worker", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node39:People{ ID:"e77", entity:"Driver", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node40:People{ ID:"e79", entity:"Construction manager", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node41:People{ ID:"e81", entity:"Design manager", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node42:Sensor{ ID:"e83", entity:"Deformation sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node43:Sensor{ ID:"e85", entity:"Convergence sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node44:Sensor{ ID:"e87", entity:"Tunnel face inspection", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node45:Sensor{ ID:"e89", entity:"Ground settlement sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node46:Sensor{ ID:"e91", entity:"Arch settlement sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node47:Sensor{ ID:"e93", entity:"Outline scanning", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node48:Sensor{ ID:"e95", entity:"Progress tracking sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node49:Sensor{ ID:"e97", entity:"Actual outline sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node50:Sensor{ ID:"e99", entity:"Material annotation", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node51:Sensor{ ID:"e101", entity:"Temperature sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node52:Sensor{ ID:"e103", entity:"Humidity sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node53:Sensor{ ID:"e105", entity:"Vibration annotation", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node54:Sensor{ ID:"e107", entity:"Hazard gas sensor", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node55:Sensor{ ID:"e109", entity:"Material inspection", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node56:Sensor{ ID:"e111", entity:"Protective layer thickness", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node57:Sensor{ ID:"e113", entity:"Rebar distribution", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node58:Sensor{ ID:"e115", entity:"Worker position", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node59:Sensor{ ID:"e117", entity:"Machine position", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node60:Sensor{ ID:"e119", entity:"Machine gesture", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node61:Sensor{ ID:"e121", entity:"Worker gesture", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 

merge (node70:Climate:Environment{ ID:"e139", entity:"Temperature", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node71:Climate:Environment{ ID:"e141", entity:"Climate", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node72:Climate:Environment{ ID:"e143", entity:"Dust", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node73:Environment{ ID:"e145", entity:"Light intensity", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node74:Environment{ ID:"e147", entity:"Hydrology", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node75:Action{ ID:"e149", entity:"Burst hole drill", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node76:Action{ ID:"e151", entity:"Upper stage excavation", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node77:Action{ ID:"e153", entity:"Buttom stage excavation", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node78:Action{ ID:"e155", entity:"Invert arch excavation", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node79:Action{ ID:"e157", entity:"Invert arch refill", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node80:Action{ ID:"e159", entity:"Action", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 
merge (node81:Action{ ID:"e161", entity:"Reshotcrete", position:"k0+000", time:"0:00", geometry:"null", property:"null",state:"null", behavior:"null",annotation:"null"}); 

