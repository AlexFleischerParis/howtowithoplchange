

    dvar float+ Gas;
    dvar float+ Chloride;  
     
    maximize 40 * Gas+ 50 * Chloride;

    subject to {

      ctMaxTotal:    
          Gas+ Chloride<= 50;

        ctMaxTotal2:   
            3 * Gas+ 4 * Chloride<= 180;

      ctMaxChloride:
        Chloride<= 40;

       ctEmpty:
         Gas<=infinity;
    }

    execute
    {
    writeln("Gas = ",Gas);
    writeln("Chloride = ",Chloride);
    writeln("Objective = ",cplex.getObjValue());
    }
     
     main
    {
       thisOplModel.generate();
       cplex.solve();
       thisOplModel.postProcess();
       
       writeln();
       writeln("And then we add the constraint Chloride - Gas <=5");
       writeln();
       
       thisOplModel.ctEmpty.UB=5;
       thisOplModel.ctEmpty.setCoef(thisOplModel.Gas,-1);
       thisOplModel.ctEmpty.setCoef(thisOplModel.Chloride,1);
       cplex.solve();
       thisOplModel.postProcess();
       
     }


/*

 which gives

 

    Gas = 20
    Chloride = 30
    Objective = 2300

     

    And then we add the constraint Chloride - Gas <=5

     

    Gas = 22.5
    Chloride = 27.5
    Objective = 2275


*/
