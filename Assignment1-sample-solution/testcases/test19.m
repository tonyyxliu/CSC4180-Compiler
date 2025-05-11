-- Input: 5, Expected Output: 5 5 5 15 5
begin
    read(A);
    B := A + 0;
    B := B;  -- redundant self assignment
    C := B * 1;
    unused := 123;  -- dead code: unused variable
    unused := 456;  -- dead code: overwritten value
    D := C + (A - A);
    E := D + 10;
    F := E - 10;
    write(B, C, D, E, F);
end 