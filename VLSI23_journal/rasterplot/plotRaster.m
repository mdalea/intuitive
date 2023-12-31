function [] = plotRaster(spikeMat, tVec)
hold all;
for trialCount = 1:size(spikeMat,1)
    tVec(trialCount,1:10)
    spikeMat(trialCount,1:10)
    spikePos = tVec(spikeMat(trialCount, :));
    spikePos(1:10)
    for spikeCount = 1:length(spikePos)
        plot([spikePos(spikeCount) spikePos(spikeCount)], ...
            [trialCount-0.4 trialCount+0.4], 'k');
    end
end
ylim([0 size(spikeMat, 1)+1]);