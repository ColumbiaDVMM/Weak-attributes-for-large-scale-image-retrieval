trainSamples = attribute_lfw.kumar_score.score;
trainSamples(trainSamples>0) = 2;
trainSamples(trainSamples<=0) = 1;
trainSamples = [attribute_lfw.merler_new.label+1; trainSamples];
trainSamples = trainSamples(:, train_idx);
options.nodeLabels = [attribute_lfw.merler_new.name; attribute_lfw.kumar_score.name];

[adjmatT, nodePot, edgePot, ll_approx] = learn_latent_tree(trainSamples, options, method);
drawLatentTree(adjmatT, num_semantic, 1, options.nodeLabels);

%% structure convert to UGM
nStates = 2;
[edgePot, edgeStruct] = tree_struct_convert(adjmatT, edgePot, options, nStates);

%% save semantic-weak-latent graph
semantic_weak.nodePot = nodePot;
semantic_weak.edgePot = edgePot;
semantic_weak.edgeStruct = edgeStruct;
semantic_weak.adjmatT = adjmatT;
save(sprintf('semantic_weak_%s.mat', method), 'semantic_weak');
