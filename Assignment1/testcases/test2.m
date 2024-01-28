-- Expected Output: -272
begin 
A := 10;
A := 314; 
B := A + 45;
C := 100 - A;
D := 415 + (200-B) + C - A;
write(D);
end