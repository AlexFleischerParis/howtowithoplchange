tuple t
{
int e1;
int e2;    
}

{t} s={<1,1>};

main {
  var source = new IloOplModelSource("subtupleset.mod");
  var cplex = new IloCplex();
  var def = new IloOplModelDefinition(source);


  for(var k=1;k<=5;k++)
  {
  var opl = new IloOplModel(def,cplex);

  var data2= new IloOplDataElements();

data2.y=thisOplModel.s;
Opl.item(thisOplModel.s,0).e2=Opl.item(thisOplModel.s,0).e2+1;
data2.y.add(k,k+1);

  opl.addDataSource(data2);
  opl.generate();

  if (cplex.solve()) {
     writeln("OBJ = " + cplex.getObjValue());
  } else {
     writeln("No solution");
  }
data2.end();
 opl.end();


}  

}

/*

gives

y= {<1 2>}
OBJ = 2
y= {<1 3> <2 3>}
OBJ = 6
y= {<1 4> <2 3> <3 4>}
OBJ = 11
y= {<1 5> <2 3> <3 4> <4 5>}
OBJ = 17
y= {<1 6> <2 3> <3 4> <4 5> <5 6>}
OBJ = 24

*/
