function [imRaw, imW, imH, imF,imRW, imRH] = imRawResize(imRaw,imW,imH,imF)
% ------------------------------------------------------------------------------------
% ��ԭʼ���ݲ���ʹ���ܹ���������ߴ�����ݴ�����Ҫ������FFT���Ƶ��Ľض�
% �������и���任�����ʵ�����ݵ�Ƶ�����Ӱ��
% ��������Ҳ���ᶨλ����ĳ���
% By Wen Xiao @SZU
%------------------------------------------------------------------------------------
    imRW = imW;
    imRH = imH;
    if((imW==imH) && (imW==64 ||imW==128 ||imW==256 ||imW==512 ||imW==1024 ||imW==2048))
    else
        if (max(imW,imH) <= 64)
            imRaw(64,64,imF)  = 0;
        elseif (max(imW,imH)<=128)
            imRaw(128,128,imF)  = 0;
        elseif(max(imW,imH)<=256)
            imRaw(256,256,imF)  = 0;
        elseif(max(imW,imH)<=512)
            imRaw(512,512,imF)  = 0;
        elseif(max(imW,imH)<=1024)
            imRaw(1024,1024,imF)  = 0;
        elseif(max(imW,imH)<=2048)
            imRaw(2048,2048,imF)  = 0;
        end
    end
    imRaw = single(imRaw);
    [imW,imH,imF] = size(imRaw); 
end