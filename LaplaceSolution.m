nx = 10;
ny = 10;
n_iterations = 10;

% Boundary conditions
BC_left = 1;
BC_right = 1;
BC_top = 0;
BC_bottom = 0;

% Solution matrix
V = zeros (ny, nx);


for k = 1 : n_iterations
    for j = 1: ny
        for i = 1 : nx
           
           %checking boundary conditions
           switch j
                case 1
                    V_bottom = BC_bottom;
                    V_top = V( j + 1, i);
                case ny
                    V_bottom = V( j - 1, i);
                    V_top = BC_top;
                otherwise 
                    V_bottom = V( j - 1, i);
                    V_top = V( j + 1, i);
           end

           switch i
                case 1
                    V_left= BC_left;
                    V_right = V(j, i + 1);
                case nx
                    V_left = V(j, i - 1);
                    V_right = BC_right;
                otherwise 
                    V_left = V( j, i - 1);
                    V_right = V(j, i + 1);
            end
                     
            V(j, i) = (V_left + V_right + V_top + V_bottom) / 4;
            
     
        end
    end
end

[Ey,Ex] = gradient(V);

            subplot(2,1,1) 
            surf (V)
            title("Electric Potential")
            xlabel("x")
            ylabel("y")
            zlabel("Potential")

            subplot(2,1,2) 
            quiver(-Ex', Ey', 1)
            title("Electric Field Vectors")
            xlabel("x")
            ylabel("y")


