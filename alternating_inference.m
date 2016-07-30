function [ nodeBel_semantic ] = alternating_inference(semantic_weak, weak_latent, target_node, target_node_state, num_semantic, num_weak )
%ALTERNATING_INFERENCE Summary of this function goes here
%   Detailed explanation goes here
% target_node_state should be 1 or 2

if target_node_state == 1
    weak_latent.nodePot(target_node,:) = [1 0];
else
    weak_latent.nodePot(target_node,:) = [0 1];
end

epsilon = 1;
epsilon_thresh = 0.001;
iter = 0;
max_iter = 10;

while(epsilon > epsilon_thresh && iter<max_iter)
    iter = iter+1;
    %% inference on graph_struct_2
    [nodeBel,~,~] = UGM_Infer_Tree(weak_latent.nodePot, weak_latent.edgePot,  weak_latent.edgeStruct);
    %% update graph_struct_1
    semantic_weak.nodePot(num_semantic+1: num_semantic+num_weak,:) = nodeBel(1:num_weak,:);
    %% inference on graph_struct_1
    [nodeBel,~,~] = UGM_Infer_Tree(semantic_weak.nodePot,semantic_weak.edgePot,semantic_weak.edgeStruct);
    %% update graph_struct_2
    weak_latent.nodePot(1:num_weak,:) = nodeBel(num_semantic+1: num_semantic+num_weak,:);
    %% convergence check
    epsilon = sum(sum((semantic_weak.nodePot(num_semantic+1: num_semantic+num_weak,:)- weak_latent.nodePot(1:num_weak,:)).^2));
end

nodeBel_semantic = nodeBel(1:num_semantic,:);

end

