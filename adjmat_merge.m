function [ adjmatT ] = adjmat_merge(semantic_weak, weak_latent, num_semantic, num_weak)

adjmatT = zeros(length(semantic_weak) + length(weak_latent)- num_weak);
adjmatT(1: length(semantic_weak), 1: length(semantic_weak)) = semantic_weak;

%% get second
weak2_idx = 1: num_weak;
latent2_idx = num_weak+1: length(weak_latent);
weak2_weak  = weak_latent(weak2_idx, weak2_idx);
latent2_latent = weak_latent(latent2_idx, latent2_idx);
weak2_latent = weak_latent(weak2_idx, latent2_idx);

%% merge
adjmatT(num_semantic+1: num_semantic+num_weak,  num_semantic+1: num_semantic+num_weak) = ...
    adjmatT(num_semantic+1: num_semantic+num_weak,  num_semantic+1: num_semantic+num_weak) +...
    weak2_weak;
adjmatT(length(semantic_weak)+1:end, length(semantic_weak)+1:end) = latent2_latent;
adjmatT(num_semantic+1: num_semantic+num_weak, length(semantic_weak)+1:end) = weak2_latent;
adjmatT = adjmatT+adjmatT';
adjmatT(adjmatT>0) = 1;
end

