import SwiftUI

struct MessageItemView: View {

    var message: Message

    var body: some View {
        HStack {
            if message.fromSelf {
                Spacer()
            }

            VStack(alignment: message.fromSelf ? .trailing : .leading) {
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
                    bottomLeadingRadius: message.fromSelf ? 10 : 0,
                    bottomTrailingRadius: message.fromSelf ? 0 : 10,
                    topTrailingRadius: 10
                )
                .foregroundStyle(message.fromSelf ? .gray : .green)

            }

            if !message.fromSelf {
                Spacer()
            }
        }
    }
}

#Preview {
    MessageItemView(message: Message(fromSelf: false, content: "HALLOHALL", timestamp: .now))
}
