%1.
function [] = PA4(row, column)
V = ones(row,column);
%V(:,column) = 0;
V(:,1) = 0; V(:,column) = 0; V(1,:) = 1; V(row,:) = 1;
[X,Y] = meshgrid(1:size(V,2),1:size(V,1));
for n = 1:50
    figure(1)
    surf(V)
    zlim([0,1])
    figure(2)
    [DX,DY] = gradient(V,1,1);
    quiver(X,Y,DX,DY)
    %imboxfilt(V,3)
    
    pause(0.2)
    for c = 2: column-1
        for r  = 2: row-1
            V(r,c) = (V(r-1,c)+V(r+1,c)+V(r,c+1)+V(r,c-1))/4
            %V(1,:) = V(2,:)
            %V(row,:) = V(row-1,:)
        end
    end
end
figure (3)
haha = imboxfilt(V,3);
imshowpair(V,haha);
end

   
