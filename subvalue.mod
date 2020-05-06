

    float maxOfx = ...;
    dvar float x;

    maximize x;
    subject to {
      x<=maxOfx;
    }

    execute
    {
    writeln("x= ",x);
    }

