tuple t
{
 int e1;
 int e2;    
}

{t} y=...;

execute
{
  writeln("y=",y);
}

dvar float x;

maximize x;
subject to {
  x<=sum(i in y)i.e2;
}

execute
{
  writeln("x=",x);
}