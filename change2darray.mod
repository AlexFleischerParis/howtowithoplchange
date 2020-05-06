

    int a[1..2][1..2];

    main {
      var source = new IloOplModelSource("sub2d.mod");
      var cplex = new IloCplex();
      var def = new IloOplModelDefinition(source);
     
     
     
      for(var k=11;k<=15;k++)
      {
      var opl = new IloOplModel(def,cplex);
     
     
        
      var data2= new IloOplDataElements();
     
      data2.y=thisOplModel.a;
      data2.y[1][1]=k;
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

    y= [[11 0]
             [0 0]]
    OBJ = 11
    y= [[12 0]
             [0 0]]
    OBJ = 12
    y= [[13 0]
             [0 0]]
    OBJ = 13
    y= [[14 0]
             [0 0]]
    OBJ = 14
    y= [[15 0]
             [0 0]]
    OBJ = 15

*/