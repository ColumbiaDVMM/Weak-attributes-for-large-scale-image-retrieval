% alternating inference on LFW. 
% implemented by Felix. X. Yu Nov. 2011

% compile UGM before running the code

clear all; close all;
addpath(genpath(pwd));
load lfw_data.mat

num_semantic = 24;
num_weak = 73;

% split data for training and testing
R = randperm(length(attribute_lfw.kumar_score.score));
train_idx = R(1:ceil(length(R)/2));
test_idx = R(ceil(length(R)/2)+1: end);

%% parameters for latent tree model
savefile = 1;
options.root = 1;
options.verbose = 1;
options.maxHidden = inf;
options.startingTree = 'MST';
method = 'regCLRG';

%% train supervised layer
learning_LFW_semantic_weak;
pause;

%% train semi-supervised layer
learning_LFW_weak_latent;
pause;

%% inference to get scores of latent nodes
latent_inference;
pause;

%% alternating inference to get P(query_attribute = 0|weak_attribute) P(query_attribute = 1|weak_attribute)
target_node = 1; % the weak attribute being considered
alternating_inference_script;
nodeBel_semantic_1
nodeBel_semantic_2