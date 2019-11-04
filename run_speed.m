clear
close all;
clc
warning off all;
addpath('./utils');

seqs=configSeqs;
trackers=configTrackers;
numSeq=length(seqs);
numTrk=length(trackers);
evalType='OPE'; %OPE and TRE  are the same
finalPath = ['./results/results_' evalType '_all/'];


for idxTrk=1:numTrk
    fps=zeros(numSeq,1);
    t = trackers{idxTrk};
    for idxSeq=1:length(seqs)
        s = seqs{idxSeq};
        % validate the results
        if exist([finalPath s.name '_' t.name '.mat'])
            load([finalPath s.name '_' t.name '.mat']);
            
            for i=1:length(results)
                fps(idxSeq)=fps(idxSeq)+ results{1,i}.fps;
            end
            fps(idxSeq)=fps(idxSeq)/length(results);
        end
    end
    avgfps=mean(fps);
    
    disp([trackers{idxTrk}.name ':' num2str(round(avgfps,1)) 'fps']);
end