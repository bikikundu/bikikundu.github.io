total_dataset = load('train.csv');
% The above file has the header labels removed. Hence, purely giving double
% type data.
total_dataset = total_dataset';
[S1, pad] = vec2mat(total_dataset,42001); 
S01 = S1(:,1:21001);% This is the training set
S02 = S1(:,21002:42001);% This is the test case set
fileId = fopen('buffer_text.txt', 'w');
i = 0;
j = 0;
fprintf(fileId,'@relation term.project');
fprintf(fileId,'\n');
for i = 2:785
    fprintf(fileId,'@attribute %d numeric', i-1);
    fprintf(fileId,'\n');
end
fprintf(fileId, '@attribute Number numeric\n');
fprintf(fileId, '\n');
fprintf(fileId, '@data\n');
for j = 1:21000
    for i = 2:785
        k = S01(i,j);
        fprintf(fileId,'%d',k);
        if(i<785)
            fprintf(fileId,',');
        end
    end
    fprintf(fileId,'%d',rem(S01(1,j),10));
    fprintf(fileId,'\n');
    j
end

    