function [ edgePot_new, edgeStruct ] = tree_struct_convert(adjmatT, edgePot, options, nStates)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% convert the latentTree format to UGM format
% Felix Oct 14

%% construct graph
edgeStruct = UGM_makeEdgeStruct(adjmatT,nStates);

%% construct edgePot_new
tree_msg_order = treeMsgOrder(adjmatT,options.root); % let 1 to be root
edge_pairs = tree_msg_order(size(tree_msg_order,1)/2+1:end,:);

edgePot_new = zeros(2,2,size(edgeStruct.edgeEnds,1));
for e=1:size(edge_pairs);
    i = edge_pairs(e,1);
    j = edge_pairs(e,2);
    idx = find(edgeStruct.edgeEnds(:,1)==i&edgeStruct.edgeEnds(:,2)==j);
    if ~isempty(idx)
        edgePot_new(:,:,idx) = full(edgePot(2*i-1:2*i,2*j-1:2*j));
        %edgePot_new(1,:,idx) = edgePot_new(1,:,idx)/sum(edgePot_new(1,:,idx));
        %edgePot_new(2,:,idx) = edgePot_new(2,:,idx)/sum(edgePot_new(2,:,idx));
    else
        idx = find(edgeStruct.edgeEnds(:,1)==j&edgeStruct.edgeEnds(:,2)==i);
        edgePot_new(:,:,idx) = full(edgePot(2*i-1:2*i,2*j-1:2*j))';
        %edgePot_new(1,:,idx) = edgePot_new(1,:,idx)/sum(edgePot_new(1,:,idx));
        %edgePot_new(2,:,idx) = edgePot_new(2,:,idx)/sum(edgePot_new(2,:,idx));
    end
end

end