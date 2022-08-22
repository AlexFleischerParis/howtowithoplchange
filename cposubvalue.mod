
    using CP;
    int maxOfx = ...;
    dvar int x;

    maximize x;
    subject to {
      x<=maxOfx;
    }

    execute
    {
    writeln("x= ",x);
    }

