function [ score_new ] = probablity2score( score_old,  nodeBel)
%PROBABLITY2SCORE Summary of this function goes here
%   Detailed explanation goes here
    score_new = zeros(1, length(nodeBel));
    score_new(1:length(score_old)) = score_old;
    max_score = max(score_old);
    min_score = min(score_old);
    
    %% project probablity to score 0 min 1 max
    score_infer = zeros(1, length(score_new)-length(score_old));
    probablity = nodeBel(length(score_old)+1:end, 2);
    parfor ii = 1: length(score_infer)
        if probablity(ii)>0.5
            score_infer(ii) = max_score/0.5*(probablity(ii)-0.5);
        else
            score_infer(ii) = -min_score/0.5*probablity(ii)+min_score;
        end
    end
    score_new(length(score_old)+1:end) = score_infer;
end