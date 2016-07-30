function [ adjmatT, nodePot, edgePot, ll_approx ] = learn_latent_tree(trainSamples, options, method)
%LEARN_LATENT_TREE Summary of this function goes here
%   Detailed explanation goes here
% Felix Oct 14

switch method
    case 'RG'
        [adjmatT,optionsEM.edge_distance] = RG(trainSamples, 0);
    case 'NJ'
        [adjmatT,optionsEM.edge_distance] = NJ(trainSamples, 0);
    case 'CLRG'
        [adjmatT,optionsEM.edge_distance] = CLRG(trainSamples, 0);
    case 'CLNJ'
        [adjmatT,optionsEM.edge_distance] = CLNJ(trainSamples, 0);
    case 'regCLRG'
        [adjmatT, edgeD, optionsEM.initNodePot, optionsEM.initEdgePot, ll, bic] = regCLRG_discrete(trainSamples, options);       
    case 'regCLNJ'
        [adjmatT, edgeD, optionsEM.initNodePot, optionsEM.initEdgePot, ll, bic] = regCLNJ_discrete(trainSamples, options);
        
end

%% for regCLRG_discrete and regCLNJ_discrete delete nodePot also
optionsEM.root = options.root;
if(~isfield(optionsEM,'initNodePot'))
    optionsEM.max_ite = 10;
    optionsEM.numStarting = 5;
    parfor i=1:optionsEM.numStarting
        [node_pot_int{i}, edge_pot_int{i}, ll_approx] = learnParamsEMmex(trainSamples,adjmatT,optionsEM);
        ll_em_int(i) = ll_approx(end);
    end
    [foo,ind] = max(ll_em_int);
    optionsEM.initNodePot = node_pot_int{ind};
    optionsEM.initEdgePot = edge_pot_int{ind};
    clear node_pot_int edge_pot_int
end
optionsEM.max_ite = 300;
[nodePot, edgePot, ll_approx] = learnParamsEMmex(trainSamples,adjmatT,optionsEM);

end

