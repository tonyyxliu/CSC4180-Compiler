-- Input (1, 2, 3), Expected Output: (5, 99, 107, 104, 103, 104)
begin
    read(A, B, C);
    D := A + (2 - C) + 3 + B - (A - A);
    E := D + 4 - (B + 5) + (100 - C);
    F := C + D + E;
    G := F - (A + B);
    I := G + (4 - 5);
    J := I + 1;
    write(D, E, F, G, I, J);
end