%The generator and parity check-matrices:
clc
n = 8;
k = 4;
identityMatrix = eye(k);
p_1 = single([1,2,4]);
p_2 = single([1,3,4]);
p_3 = single([1,2,3]);
p_4 = single([2,3,4]);
p1=sum(identityMatrix(:,p_1),2);
p2=sum(identityMatrix(:,p_2),2);
p3=sum(identityMatrix(:,p_3),2);
p4=sum(identityMatrix(:,p_4),2);
parityMatrix = mod([p1,p2,p3,p4],2);
generatorMatrix = [parityMatrix,identityMatrix]
parityCheck = [eye(n-k),parityMatrix']

%Test [1 0 1 0 1 0 1 0]
receivedVector = [1 0 1 0 1 0 1 0];
syndromeVector = receivedVector*transpose(parityCheck);
syndrome = mod(syndromeVector,2)

%Test [0 1 0 1 1 1 0 0]
receivedVector = [0 1 0 1 1 1 0 0];
syndromeVector = receivedVector*transpose(parityCheck);
syndrome = mod(syndromeVector,2)