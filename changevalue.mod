

    main {
      var source = new IloOplModelSource("subvalue.mod");
      var cplex = new IloCplex();
      var def = new IloOplModelDefinition(source);
     
     
     
      for(var k=1;k<=10;k++)
      {
      var opl = new IloOplModel(def,cplex);
        
      var data2= new IloOplDataElements();
      data2.maxOfx=k;
      opl.addDataSource(data2);
      opl.generate();

      if (cplex.solve()) {  
         opl.postProcess();
         writeln("OBJ = " + cplex.getObjValue());
      } else {
         writeln("No solution");
      }
     opl.end();
    }  
     
    }

/*

gives

    x= 1
    OBJ = 1
    x= 2
    OBJ = 2
    x= 3
    OBJ = 3
    x= 4
    OBJ = 4
    x= 5
    OBJ = 5
    x= 6
    OBJ = 6
    x= 7
    OBJ = 7
    x= 8
    OBJ = 8
    x= 9
    OBJ = 9
    x= 10
    OBJ = 10
    
    */

