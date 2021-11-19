//Test file for MULT4 
load MULT4.hdl,
output-file  MULT4.out,
output-list a%B1.4.1 b%B1.4.1 s%B1.8.1 u%B1.6.1;

set a %B0010,
set b %B1111,
eval,
output;