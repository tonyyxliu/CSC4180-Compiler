-- Input: 7, Expected Output: 7 7 14 0
begin
    read(X);
    A := X + 0;
    B := A * 1;
    C := A + B;
    D := C - C;
    X := X;  -- redundant self-assignment
    write(A, B, C, D);
end 