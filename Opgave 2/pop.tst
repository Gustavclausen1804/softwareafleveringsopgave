load Pop.asm,
output-file PopSamples.out,
output-list RAM[1]%D2.6.2;

set RAM[0] 5;
repeat 5000 {
  ticktock;
}
output;

set PC 0,
set RAM[0] 6;
repeat 5000 {
  ticktock;
}
output;