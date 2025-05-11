-- Input: 4, -2, Expected Output: (12, -6, 16, 1)
begin
    read(P);
    read(Q);
    R := (2 * (P + (Q - 1))) * (P - Q);
    S := R + (P * Q) - (10);
    T := P * Q * Q;
    U := (P + Q) / 2;
    write(R, S, T, U);
end 