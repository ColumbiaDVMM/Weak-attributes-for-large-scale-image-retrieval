lfw_data.mat contains information of lfw dataset.

attribute_lfw = 
    merler_ground_truth: [1x1 struct]         original ground-truth provided by Michele Merler (27 attributes)
                    idx: [9928x1 double]      index of the images of LFW
                   path: {9928x1 cell}			  path of the images
            kumar_score: [1x1 struct]         73 classifier scores as weak attributes (provided by Niraj Kumar)
             merler_new: [1x1 struct]         ground-truth of 24 query attributes
              kumar_new: [1x1 struct]         24 individual classifier output for 24 query attributes (provided by Niraj Kumar)
        kumar_inference: [1x1 struct]         latent variables as weak attribtues