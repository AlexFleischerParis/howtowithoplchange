

    using CP;

        dvar int+ Gas;
        dvar int+ Chloride;  
         
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
        writeln("Objective = ",cp.getObjValue());
        }
         
         main
        {
           thisOplModel.generate();
           cp.solve();
           thisOplModel.postProcess();
           
           writeln();
           writeln("And then we add the constraint Chloride - Gas <=5");
           writeln();
           
           thisOplModel.ctEmpty.UB=5;
           thisOplModel.ctEmpty.setCoef(thisOplModel.Gas,-1);
           thisOplModel.ctEmpty.setCoef(thisOplModel.Chloride,1);
           cp.solve();
           thisOplModel.postProcess();
           
         }
         
         /*

gives

    Gas = 20
    Chloride = 30
    Objective = 2300

    And then we add the constraint Chloride - Gas <=5

    Gas = 23
    Chloride = 27
    Objective = 2270

 */ 
