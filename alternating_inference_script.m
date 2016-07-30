%% alternating inference

load lfw_data.mat
load semantic_weak_regCLRG
load weak_latent_regCLRG
num_weak_latent = length(weak_latent.adjmatT);

entropy = zeros(num_semantic, num_weak);

%% margin of weak attributes
[margin_weak,~,~] = UGM_Infer_Tree(weak_latent.nodePot,weak_latent.edgePot,weak_latent.edgeStruct);

%% margin of semantic attributes
[margin_semantic,~,~] = UGM_Infer_Tree(semantic_weak.nodePot,semantic_weak.edgePot,semantic_weak.edgeStruct);
margin_semantic = margin_semantic(1:num_semantic,:);
whiten_trainsform = ones(size(margin_semantic))*0.5./margin_semantic;

target_node_state = 1;
nodeBel_semantic_1 = alternating_inference(semantic_weak, weak_latent, target_node, target_node_state, num_semantic, num_weak);
target_node_state = 2;
nodeBel_semantic_2 = alternating_inference(semantic_weak, weak_latent, target_node, target_node_state, num_semantic, num_weak);
    
%     for query_idx = 1: num_semantic % for each query node
%         
%         P1 = nodeBel_semantic_1(query_idx,:);
%         P2 = nodeBel_semantic_2(query_idx,:);
%  
%         % whitening
%         P1 = P1.*whiten_trainsform(query_idx,:);
%         P2 = P2.*whiten_trainsform(query_idx,:);
%         P1 = P1/sum(P1);
%         P2 = P2/sum(P2);
% 
%         entropy(query_idx,target_node) = -margin_weak(target_node,1)*sum(P1.*log(P1))-margin_weak(target_node,2)*sum(P2.*log(P2));
%     end