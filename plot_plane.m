function [] = plot_plane( w, color )
%plot_plane Summary Plots a plane with given normal vector and color
if size(w) ~= [3,1]
	disp('Error: input normal has to be a 3 by 1 vector');
	return
end
hold on;
xlim = 3*[-1 -1;1 -1;1 1 ;-1 1];
ylim = [xlim ones(4,1)]*w;
% view(3)
patch(xlim(:,1),xlim(:,2),ylim,color);
alpha(0.3);

end

