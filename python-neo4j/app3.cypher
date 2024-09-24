//施工进度追踪
merge (node1:Construction:Aggregation{GUID:"AGGR1", Entity:"ConstructionAggregationByTime",Name:"时间索引施工过程", Data:["ZK1+000-ZK2+200:sf5a","ZK2+200-ZK3+000:sf4b"],Geometry:"three.js",Description:"沿里程设计方案"});

// 喷射混凝土节点导入
load CSV with Headers from "file:///progress.csv" AS line1 
merge (a1:Pri_support:Structure{Proj:line1.Proj,ID:line1.ID,Entity_chn:line1.Entity_chn,Time:line1.Time,Startmilage:line1.Startmilage,Endmilage:line1.Endmilage,Length:line1.Length,Thickness:line1.Thickness,Geometry:line1.Geometry,Physics:line1.Physics,State:line1.State,Rule:line1.Rule,Behavior:line1.Behavior})

//二衬节点导入
load CSV with Headers from "file:///Secondarylining.csv" AS line2
merge (a2:Secondarylining:Structure{Proj:line2.Proj,ID:line2.ID,Entity_chn:line2.Entity_chn,Time:line2.Time,Startmilage:line2.Startmilage,Endmilage:line2.Endmilage,Length:line2.Length,Thickness:line2.Thickness,Geometry:line2.Geometry,Physics:line2.Physics,State:line2.State,Rule:line2.Rule,Behavior:line2.Behavior})

// 空间关系定义
load CSV with Headers from "file:///SPrelation.csv" AS line3
match (from),(to) where from.ID=line3.from and to.ID=line3.to merge (from)-[r41:SpatialRelation{ID:line3.ID, Property:line3.Property, Category:line3.Category}]->(to)

//时间关系定义
load CSV with Headers from "file:///TMrelation.csv" AS line4
match (from),(to) where from.ID=line4.from and to.ID=line4.to merge (from)-[r42:TemporalRelation{ID:line4.ID, Property:line4.Property, Category:line4.Category}]->(to)

//系统关系定义
load CSV with Headers from "file:///SYrelation.csv" AS line
match (from),(to) where from.ID=line.from and to.ID=line.to merge (from)-[r43:SystemRelation{ID:line.ID, Property:line.Property, Category:line.Category}]->(to)


merge (a13:Secondarylining:Structure{Proj:line2.Proj,ID:line2.ID,Entity_chn:line2.Entity_chn,Time:line2.Time,Startmilage:line2.Startmilage,Endmilage:line2.Endmilage,Length:line2.Length,Thickness:line2.Thickness,Geometry:line2.Geometry,Physics:line2.Physics,State:line2.State,Rule:line2.Rule,Behavior:line2.Behavior})

match (m), (n) where m.ID='PRES1' AND n.ID='PRES2' merge (m)-[r44:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES2' AND n.ID='PRES3' merge (m)-[r45:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES3' AND n.ID='PRES4' merge (m)-[r46:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES4' AND n.ID='PRES5' merge (m)-[r47:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES5' AND n.ID='PRES6' merge (m)-[r48:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES6' AND n.ID='PRES7' merge (m)-[r49:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES7' AND n.ID='PRES8' merge (m)-[r50:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES8' AND n.ID='PRES9' merge (m)-[r51:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES9' AND n.ID='PRES10' merge (m)-[r52:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES10' AND n.ID='PRES11' merge (m)-[r53:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES11' AND n.ID='PRES12' merge (m)-[r54:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES12' AND n.ID='PRES13' merge (m)-[r55:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES13' AND n.ID='PRES14' merge (m)-[r56:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES14' AND n.ID='PRES15' merge (m)-[r57:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES15' AND n.ID='PRES16' merge (m)-[r58:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES16' AND n.ID='PRES17' merge (m)-[r59:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES17' AND n.ID='PRES18' merge (m)-[r60:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES18' AND n.ID='PRES19' merge (m)-[r61:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES19' AND n.ID='PRES20' merge (m)-[r62:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES20' AND n.ID='PRES21' merge (m)-[r63:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES21' AND n.ID='PRES22' merge (m)-[r64:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES22' AND n.ID='PRES23' merge (m)-[r65:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES23' AND n.ID='PRES24' merge (m)-[r66:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES24' AND n.ID='PRES25' merge (m)-[r67:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES25' AND n.ID='PRES26' merge (m)-[r68:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES26' AND n.ID='PRES27' merge (m)-[r69:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES27' AND n.ID='PRES28' merge (m)-[r70:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES28' AND n.ID='PRES29' merge (m)-[r71:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES29' AND n.ID='PRES30' merge (m)-[r72:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES30' AND n.ID='PRES31' merge (m)-[r73:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES31' AND n.ID='PRES32' merge (m)-[r74:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES32' AND n.ID='PRES33' merge (m)-[r75:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES33' AND n.ID='PRES34' merge (m)-[r76:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES34' AND n.ID='PRES35' merge (m)-[r77:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES35' AND n.ID='PRES36' merge (m)-[r78:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES36' AND n.ID='PRES37' merge (m)-[r79:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES37' AND n.ID='PRES38' merge (m)-[r80:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES38' AND n.ID='PRES39' merge (m)-[r81:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES39' AND n.ID='PRES40' merge (m)-[r82:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES40' AND n.ID='PRES41' merge (m)-[r83:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES41' AND n.ID='PRES42' merge (m)-[r84:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES42' AND n.ID='PRES43' merge (m)-[r85:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES43' AND n.ID='PRES44' merge (m)-[r86:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES44' AND n.ID='PRES45' merge (m)-[r87:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES45' AND n.ID='PRES46' merge (m)-[r88:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES46' AND n.ID='PRES47' merge (m)-[r89:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES47' AND n.ID='PRES48' merge (m)-[r90:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES48' AND n.ID='PRES49' merge (m)-[r91:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES49' AND n.ID='PRES50' merge (m)-[r92:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES50' AND n.ID='PRES51' merge (m)-[r93:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES51' AND n.ID='PRES52' merge (m)-[r94:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES52' AND n.ID='PRES53' merge (m)-[r95:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES53' AND n.ID='PRES54' merge (m)-[r96:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES54' AND n.ID='PRES55' merge (m)-[r97:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES55' AND n.ID='PRES56' merge (m)-[r98:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES56' AND n.ID='PRES57' merge (m)-[r99:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES57' AND n.ID='PRES58' merge (m)-[r100:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES58' AND n.ID='PRES59' merge (m)-[r101:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES59' AND n.ID='PRES60' merge (m)-[r102:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES60' AND n.ID='PRES61' merge (m)-[r103:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES61' AND n.ID='PRES62' merge (m)-[r104:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES62' AND n.ID='PRES63' merge (m)-[r105:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES63' AND n.ID='PRES64' merge (m)-[r106:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES64' AND n.ID='PRES65' merge (m)-[r107:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES65' AND n.ID='PRES66' merge (m)-[r108:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES66' AND n.ID='PRES67' merge (m)-[r109:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES67' AND n.ID='PRES68' merge (m)-[r110:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES68' AND n.ID='PRES69' merge (m)-[r111:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES69' AND n.ID='PRES70' merge (m)-[r112:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES70' AND n.ID='PRES71' merge (m)-[r113:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES71' AND n.ID='PRES72' merge (m)-[r114:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES72' AND n.ID='PRES73' merge (m)-[r115:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES73' AND n.ID='PRES74' merge (m)-[r116:SpatialRelation{ID:"SYSR6", Property:"connect with", Category:"RelativeSPRL"}]->(n);



match (m), (n) where m.GUID='VERE5' AND n.ID='PRES1' merge (m)-[r117:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES2' merge (m)-[r118:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES3' merge (m)-[r119:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES4' merge (m)-[r120:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES5' merge (m)-[r121:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES6' merge (m)-[r122:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES7' merge (m)-[r123:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES8' merge (m)-[r124:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES9' merge (m)-[r125:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES10' merge (m)-[r126:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES11' merge (m)-[r127:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES12' merge (m)-[r128:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES13' merge (m)-[r129:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES14' merge (m)-[r130:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES15' merge (m)-[r131:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES16' merge (m)-[r132:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES17' merge (m)-[r133:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES18' merge (m)-[r134:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES19' merge (m)-[r135:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES20' merge (m)-[r136:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES21' merge (m)-[r137:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES22' merge (m)-[r138:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES23' merge (m)-[r139:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES24' merge (m)-[r140:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES25' merge (m)-[r141:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES26' merge (m)-[r142:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES27' merge (m)-[r143:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES28' merge (m)-[r144:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES29' merge (m)-[r145:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES30' merge (m)-[r146:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES31' merge (m)-[r147:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES32' merge (m)-[r148:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES33' merge (m)-[r149:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES34' merge (m)-[r150:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES35' merge (m)-[r151:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES36' merge (m)-[r152:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES37' merge (m)-[r153:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES38' merge (m)-[r154:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES39' merge (m)-[r155:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES40' merge (m)-[r156:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES41' merge (m)-[r157:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES42' merge (m)-[r158:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES43' merge (m)-[r159:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES44' merge (m)-[r160:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES45' merge (m)-[r161:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES46' merge (m)-[r162:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES47' merge (m)-[r163:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES48' merge (m)-[r164:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES49' merge (m)-[r165:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES50' merge (m)-[r166:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES51' merge (m)-[r167:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES52' merge (m)-[r168:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES53' merge (m)-[r169:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES54' merge (m)-[r170:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES55' merge (m)-[r171:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES56' merge (m)-[r172:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES57' merge (m)-[r173:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES58' merge (m)-[r174:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES59' merge (m)-[r175:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES60' merge (m)-[r176:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES61' merge (m)-[r177:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES62' merge (m)-[r178:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES63' merge (m)-[r179:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES64' merge (m)-[r180:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES65' merge (m)-[r181:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES66' merge (m)-[r182:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES67' merge (m)-[r183:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES68' merge (m)-[r184:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES69' merge (m)-[r185:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES70' merge (m)-[r186:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES71' merge (m)-[r187:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES72' merge (m)-[r188:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES73' merge (m)-[r189:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='PRES74' merge (m)-[r0:SystemRelation{ID:"SYSR6", Property:"has", Category:"SYRL"}]->(n);


merge (node1:Structure{ ID:"VE170", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6709,6721]]", time:"2020-08-26", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE172", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6699,6709]]", time:"2020-08-24", geometry:"null",length:"[value:10,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE174", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6687,6699]]", time:"2020-08-22", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE178", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6675,6687]]", time:"2020-08-18", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE179", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6669,6675]]", time:"2020-08-17", geometry:"null",length:"[value:6,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE180", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6667,6669]]", time:"2020-08-16", geometry:"null",length:"[value:2,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE181", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6656,6667]]", time:"2020-08-04", geometry:"null",length:"[value:11,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE185", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6644,6656]]", time:"2020-07-31", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE188", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6632,6644]]", time:"2020-07-28", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE191", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6620,6632]]", time:"2020-07-25", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE194", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6608,6620]]", time:"2020-07-22", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE196", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6596,6608]]", time:"2020-07-20", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE198", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6584,6596]]", time:"2020-07-18", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE201", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6574,6584]]", time:"2020-07-15", geometry:"null",length:"[value:10,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE208", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6562,6574]]", time:"2020-07-08", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE214", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6550,6562]]", time:"2020-07-02", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE218", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6538,6550]]", time:"2020-06-28", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE224", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6526,6538]]", time:"2020-06-22", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE227", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6514,6526]]", time:"2020-06-19", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});
merge (node1:Structure{ ID:"VE236", Entity:"SecondaryLining", StartMilage:"[MileageRange:[6502,6514]]", time:"2020-06-10", geometry:"null",length:"[value:12,unit:m]",property:"[belongto:S2R]",state:"null", behavior:"null",annotation:"null"});


match (m), (n) where m.ID='PRES3' AND n.ID='VE170' merge (m)-[r1:SpatialRelation{ID:"SYSR6", Property:"177.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES5' AND n.ID='VE172' merge (m)-[r2:SpatialRelation{ID:"SYSR6", Property:"167.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES7' AND n.ID='VE174' merge (m)-[r3:SpatialRelation{ID:"SYSR6", Property:"165.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES11' AND n.ID='VE178' merge (m)-[r4:SpatialRelation{ID:"SYSR6", Property:"172.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES12' AND n.ID='VE179' merge (m)-[r5:SpatialRelation{ID:"SYSR6", Property:"167.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES13' AND n.ID='VE180' merge (m)-[r6:SpatialRelation{ID:"SYSR6", Property:"167.1m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES14' AND n.ID='VE181' merge (m)-[r7:SpatialRelation{ID:"SYSR6", Property:"155.3m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES18' AND n.ID='VE185' merge (m)-[r8:SpatialRelation{ID:"SYSR6", Property:"165m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES21' AND n.ID='VE188' merge (m)-[r9:SpatialRelation{ID:"SYSR6", Property:"171m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES24' AND n.ID='VE191' merge (m)-[r10:SpatialRelation{ID:"SYSR6", Property:"176m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES27' AND n.ID='VE194' merge (m)-[r11:SpatialRelation{ID:"SYSR6", Property:"182.5m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES29' AND n.ID='VE196' merge (m)-[r12:SpatialRelation{ID:"SYSR6", Property:"190.5m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES31' AND n.ID='VE198' merge (m)-[r13:SpatialRelation{ID:"SYSR6", Property:"196.5m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES34' AND n.ID='VE201' merge (m)-[r14:SpatialRelation{ID:"SYSR6", Property:"188m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES41' AND n.ID='VE208' merge (m)-[r15:SpatialRelation{ID:"SYSR6", Property:"179.4m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES47' AND n.ID='VE214' merge (m)-[r16:SpatialRelation{ID:"SYSR6", Property:"162.2m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES51' AND n.ID='VE218' merge (m)-[r17:SpatialRelation{ID:"SYSR6", Property:"151m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES57' AND n.ID='VE224' merge (m)-[r18:SpatialRelation{ID:"SYSR6", Property:"133.6m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES60' AND n.ID='VE227' merge (m)-[r19:SpatialRelation{ID:"SYSR6", Property:"132.2m ahead of", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.ID='PRES69' AND n.ID='VE236' merge (m)-[r20:SpatialRelation{ID:"SYSR6", Property:"109.6m ahead of", Category:"RelativeSPRL"}]->(n);
//掌子面
match (m), (n) where m.GUID='VERE5' AND n.ID='VE170' merge (m)-[r21:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE172' merge (m)-[r22:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE174' merge (m)-[r23:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE178' merge (m)-[r24:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE179' merge (m)-[r25:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE180' merge (m)-[r26:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE181' merge (m)-[r27:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE185' merge (m)-[r28:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE188' merge (m)-[r29:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE191' merge (m)-[r30:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE194' merge (m)-[r31:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE196' merge (m)-[r32:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE198' merge (m)-[r33:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE201' merge (m)-[r34:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE208' merge (m)-[r35:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE214' merge (m)-[r36:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE218' merge (m)-[r37:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE224' merge (m)-[r38:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE227' merge (m)-[r39:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);
match (m), (n) where m.GUID='VERE5' AND n.ID='VE236' merge (m)-[r40:SystemRelation{ID:"SYSR6", Property:"has", Category:"RelativeSPRL"}]->(n);