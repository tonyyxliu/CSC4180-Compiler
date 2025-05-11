-- Input: 3, Expected Output: 9 9 0 27 3
begin
    read(X);
    Y := X * 3;
    Z := Y + 0;
    M := Z - Z;
    N := Y * 1;
    P := (M + N) * 3;
    Q := X;
    Q := Q;  -- redundant self-assignment
    write(Y, Z, M, P, Q);
end