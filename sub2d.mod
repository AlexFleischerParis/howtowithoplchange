

    int y[1..2][1..2]=...;

    execute
    {
    writeln("y=",y);
    }

    dvar float x;

    maximize x;
    subject to {
      x<=sum(i in 1..2, j  in 1..2) y[i][j];
    }

