import numpy as np


#utility to get Pearson correlation matrix
def get_locs(Dcode):
    idx_tr = np.triu_indices(Dcode)
    arr = np.zeros(Dcode)
    for x in range(Dcode):
        arr[x] = np.intersect1d(np.argwhere(idx_tr[0] == x), np.argwhere(idx_tr[1] == x))[0]
       
    return arr


def normalize_corr_mat(Dcode, mat, arr):
    idx_tr = np.triu_indices(Dcode)
    corr_mat_new = np.zeros((mat.shape[0], len(idx_tr[0])))
    x = idx_tr[0]
    y = idx_tr[1]
    idx1 = arr[x].astype(int)
    idx2 = arr[y].astype(int)
    for s in range(mat.shape[0]):
        corr_mat = np.cov(mat[s,:,:])[idx_tr]
        norm_vec = np.sqrt(corr_mat[idx1] * corr_mat[idx2])
        norm_vec[norm_vec == 0] = 1
        corr_mat_new[s,:] = corr_mat[:] / norm_vec
       
    return corr_mat_new    


def re_encode_pearson(Dcode, mat, mean_data, mode = 0):
    arr = get_locs(Dcode)
    cov_data = normalize_corr_mat(Dcode, mat, arr)
    idx_tr = np.triu_indices(Dcode)
    for i in range(mean_data.shape[0]):
        tra = mean_data[i,:]
        mean_mat = np.abs(np.outer(tra, tra))
        mean_hist = mean_mat[idx_tr]
        if mode == 0:
            cov_data[i,:] = cov_data[i,:] + mean_hist
       
    return cov_data

