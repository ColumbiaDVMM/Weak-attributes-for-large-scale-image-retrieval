
% use all test data for training unsupervised layer
trainSamples = attribute_lfw.kumar_score.score;
trainSamples(trainSamples>0) = 2;
trainSamples(trainSamples<=0) = 1;
trainSamples = trainSamples(:, test_idx);
options.nodeLabels = attribute_lfw.kumar_score.name;

[adjmatT, nodePot, edgePot, ll_approx] = learn_latent_tree(trainSamples, options, method);
drawLatentTree(adjmatT, num_weak, 1, options.nodeLabels);

%% structure convert to UGM
nStates = 2;
[edgePot, edgeStruct] = tree_struct_convert(adjmatT, edgePot, options, nStates);

%% save semantic-weak-latent graph
weak_latent.nodePot = nodePot;
weak_latent.edgePot = edgePot;
weak_latent.edgeStruct = edgeStruct;
weak_latent.adjmatT = adjmatT;
save(sprintf('weak_latent_%s.mat', method), 'weak_latent');