function [imRAW,imW,imH,Totalimage,imRW,imRH] = AllImageStackRead(FileNames,PathName,Count2photon,Baseline)
% ------------------------------------------------------------------------------------
% ��ȡһ���ļ����µ������Ӷ�ջ 
% by Wen Xiao @SZU 2019
%------------------------------------------------------------------------------------
%Ȼ����ݺ�׺��ɸѡ��ָ�������ļ�������
[n , ~] = size(FileNames);%��ô�С

Totalimage = 0;
for i = 1:n
    if ~isempty( strfind(FileNames{i}, '.tif') )%ɸѡ��tif�ļ�
        filename = FileNames{i};
        filepath = fullfile(PathName,filename);
        Data = bfOpen3DVolume(filepath);        
        imgStack = Data{1,1}{1,1};
        [imH,imW,imF] = size(imgStack);
        imR = zeros(imH,imW,imF);
        for f = 1:imF
            imR(:,:,f) = (imgStack(:,:,f)-Baseline)*Count2photon;
        end        
        imRAW(:,:,Totalimage+1:Totalimage +imF) = imR;
        Totalimage = Totalimage +imF;  
    end
end

%����ʵ��
[imRAW, imW, imH,Totalimage,imRW,imRH] = imRawResize(imRAW,imW,imH,Totalimage);
if (~isempty(gcp('nocreate')))
    imRAW = imRAW2imRAW100(imRAW,imW,imH,Totalimage);
end
end