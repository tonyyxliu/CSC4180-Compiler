-- Input: 5, Expected Output: (58, -27, 6)
begin
    read(X);
    A := (2 * (X + 3)) + ((10 - (X - 2)) * (X + 1));
    B := (A - 50) - (2 * X);
    C := (X + 1);
    write(A, B - X * X, C);
end 