-- Expected Output: 2
begin
    A := 2;
    B := 1 + 4 / (A * A) + A * 0;
    write(B);
end