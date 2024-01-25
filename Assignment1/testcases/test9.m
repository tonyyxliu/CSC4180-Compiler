-- Input: 1, Expected Output: (3, 20, 1, -1, -123, 255, 0, 0)
begin
    A := 1 + 1 + 1;
    B := (A + 5) + ( A + ( A + ( A + -1 ) ) ) + ( +5 ) - ( 1 );
    C := ((((1))));
    read ( D );
    write ( A, B, C, -D, 0-123, 255, 0, 0 );
    -- write(A+B, A+B, A+B, A+B, A+B, A+B, A+B, A+B, A+B, A+B, A+B, A+B);
end