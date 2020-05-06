

    {int} s={};

    main {
      var source = new IloOplModelSource("subset.mod");
      var cplex = new IloCplex();
      var def = new IloOplModelDefinition(source);
     
     
      for(var k=1;k<=5;k++)
      {
      var opl = new IloOplModel(def,cplex);
        
      var data2= new IloOplDataElements();
     
    data2.y=thisOplModel.s;
    data2.y.add(k);
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

 

    y= {1}
    OBJ = 1
    y= {1 2}
    OBJ = 3
    y= {1 2 3}
    OBJ = 6
    y= {1 2 3 4}
    OBJ = 10
    y= {1 2 3 4 5}
    OBJ = 15
*/
