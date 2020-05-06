

    {int} y=...;

    execute
    {
    writeln("y=",y);
    }

    dvar float x;

    maximize x;
    subject to {
      x<=sum(i in y)i;
    }

    execute
    {
    writeln("x=",x);
    }

