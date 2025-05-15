import SwiftUI

struct MessageItemView: View {

    var message: Message

    var body: some View {
        HStack {
            if false {
                Spacer()
            }

            VStack(alignment: false ? .trailing : .leading) {
                Text(message.content)
                    .font(.title2)
                Text(message.timestamp.formatted(date: .numeric, time: .shortened))
                    .font(.footnote)
            }
            .padding()
            .background {
                // Control + M um parameter untereinander anzuordnen
                UnevenRoundedRectangle(
                    topLeadingRadius: 10,
                    bottomLeadingRadius: false ? 10 : 0,
                    bottomTrailingRadius: false ? 0 : 10,
                    topTrailingRadius: 10
                )
                .foregroundStyle(false ? .gray : .green)

            }

            if !false {
                Spacer()
            }
        }
    }
}

#Preview {
    MessageItemView(message: Message(senderID: "A", content: "HALLOHALL", timestamp: .now))
}
