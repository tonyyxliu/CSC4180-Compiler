-- Expected Output: 20 20 20 8 50 0
begin
    A := 10;
    A := 20;
    B := A + 0;
    C := B * 1;
    D := 5;
    D := D + 3;
    E := 100;
    E := E - 50;
    F := 0;
    F := F + 0;
    G := 123;  -- dead code: unused variable
    H := 99;
    H := 100;  -- dead code: overwritten and unused
    write(A, B, C, D, E, F);
end 