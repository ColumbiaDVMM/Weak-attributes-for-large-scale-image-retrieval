% perform inferene for all images with observed nodes (based on 0/1 classifier result)
% Oct 15 Felix X. Yu

load weak_latent_regCLRG

nNodes = size(weak_latent.nodePot,1);
img_num = length(attribute_lfw.kumar_score.score);
att_num = length(weak_latent.nodePot);
attribute_lfw.kumar_inference.score = zeros(att_num, img_num);

for ii = 1:img_num
    clamped = zeros(nNodes,1);
    score = attribute_lfw.kumar_score.score(:,ii);
    score(score>0) = 2;
    score(score<=0)= 1;
    clamped(1:length(score)) = score;
    [nodeBel,edgeBel,logZ] = UGM_Infer_Conditional(weak_latent.nodePot, weak_latent.edgePot,...
        weak_latent.edgeStruct, clamped, @UGM_Infer_Tree);
    attribute_lfw.kumar_inference.score(:,ii) = probablity2score(attribute_lfw.kumar_score.score(:,ii), nodeBel);
end
save('lfw_data.mat', 'attribute_lfw');